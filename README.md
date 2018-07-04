# Test Factories

We just learned about using `RSpec` test doubles to facilitate setting up your tests. But sometimes using a `double` is not enough. There are times in our tests where we want to use actual objects from our application.

As an application grows, a common problem with creating application objects on the fly is that they become complex. A `User` object may require a password, a territory, a role, etc. And these requirements typically have model validations that ensure these are present. Which means we can not leave them out everytime we create a `User` instance.

When a `user_spec` checks an isolated unit of functionality, like assigning a `user`'s TShirt size for example, then adding these necessary fields to your `User` object becomes a chore. It is also a distraction from the intent of the test. A test that is designed to assert behavior around TShirt size should not have anything to do with a `user`'s role or password.

Enter test factories.

![Factory](https://raw.githubusercontent.com/powerhome/phrg-testing-with-factories/master/factory.jpg?raw=true "Factory")

## What is a Test Factory

A factory is a blueprint that allows us to create an object, or a collection of objects, with a predefined set of values. Factories let us maintain simple definitions in a single place, but also allow us to manage all data related to the test itself when we need to.

The standard library to create factories in `Rails` is called [`FactoryBot`](https://github.com/thoughtbot/factory_bot) (formerly called `FactoryGirl`). This library has been around a very long time and has a lot of useful features. Because of `FactoryBot`'s age, it has also grown through a variety of syntaxes. You will discover many advanced features and different syntaxes throughout Nitro's testing factories.

## Examples

Let's make a factory for our `User`:

```ruby
# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    first_name "Rick"
    last_name "Sanchez"
    territory "Philadelphia"
    role "Student Developer"
    veteran false
    password "ddhh110088"
  end
end
```

And use it for our TShirt test:

```ruby
# spec/models/user_spec.rb

RSpec.describe User, type: :model do
  describe "#tshirt_size" do
    it "returns tshirt_size for user" do
      user = build(:user, tshirt_size: "M")
      expect(user.tshirt_size).to eq("M")
    end
  end
end
```

In this example, the `build` method constructs a `User` object before it's been saved to the database (so with a `nil` `id`). Although not in use, the `user` object above has all the attributes defined in its factory blueprint. So `user.role == "Student Developer"` and `user.veteran == false`.

`FactoryBot` has a number of ways to construct a factory object. Here is an excerpt for [factory_bot's `GETTING_STARTED` guide](https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#using-factories) explaining ways to make an object.

```ruby
# Returns a User instance that's not saved
user = build(:user)

# Returns a saved User instance
user = create(:user)

# Returns a hash of attributes that can be used to build a User instance
attrs = attributes_for(:user)

# Returns an object with all defined attributes stubbed out
stub = build_stubbed(:user)

# Passing a block to any of the methods above will yield the return object
create(:user) do |user|
  user.posts.create(attributes_for(:post))
end
```

It is a good idea to use `build` and `build_stubbed` everywhere possible. Because these instances are not saved, they are faster to setup and cleanup. This creates faster tests.

### Overwriting

`FactoryBot` lets one overwrite any value for any attribute on the model, including specifying `nil`. For example:

```ruby
RSpec.describe User, type: :model do
  describe "is not valid" do
    it "without a last name" do
      user = build(:user, last_name: nil)
      expect(user).to_not be_valid
    end
  end
end
```

Or:

```ruby
RSpec.describe User, type: :model do
  describe "#senior_developer?" do
    it "returns true when a 'Solution Architect'" do
      user = build(:user, role: "Solution Architect")
      expect(user.senior_developer?).to be true
    end
  end
end
```

### Using Associations

`FactoryBot` also makes it easy to setup associations between your objects. For example, in Nitro, `territory` and `role` are both domain objects themselves. Let's adjust our `User` factory to account for a `belongs_to` relationship to `Territory`.

First we need a `Territory` factory:

```ruby
# spec/factories/territories.rb

FactoryBot.define do
  factory :territory do
    name "Philadelphia"
    abbr "PA"
    time_zone "Eastern Time (US & Canada)"
  end
end
```

And now adjust the `User` factory:

```ruby
FactoryBot.define do
  factory :user do
    first_name "Rick"
    last_name "Sanchez"
    territory
    role "Student Developer"
    veteran false
    password "ddhh110088"
  end
end
```

Yep. It was that easy. Another common syntax to set up an association is to use the `association` keyword. Below is an identical implementation.

```ruby
FactoryBot.define do
  factory :user do
    first_name "Rick"
    last_name "Sanchez"
    association :territory
    role "Student Developer"
    veteran false
    password "ddhh110088"
  end
end
```

If we wanted our `User` factory to have a different `territory` name than what is specified in our territory factory, we could pass the attribute a block. The example below is a blueprint for a `user` from Atlanta.

```ruby
FactoryBot.define do
  factory :user do
    first_name "Rick"
    last_name "Sanchez"
    territory { build(:territory, name: "Atlanta", abbr: "GA") }
    role "Student Developer"
    veteran false
    password "ddhh110088"
  end
end
```

The DSL for `factory_bot` is robust. To learn more techniques, such as using traits, sequences, and setting up associations under aliases, check out the `FactoryBot` [documentation](https://www.rubydoc.info/gems/factory_bot/4.10.0) and [repo](https://github.com/thoughtbot/factory_bot). You will also find advanced usage examples in the Nitro codebase itself.

## Lab

## Resources

- [FactoryBot on Github](https://github.com/thoughtbot/factory_bot)
- [Getting Started with FactoryBot](https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md)
- [Working Effectively With Data Factories Using FactoryBot](https://semaphoreci.com/community/tutorials/working-effectively-with-data-factories-using-factorybot)
- [Rails Testing Antipatterns: Fixtures and Factories](https://semaphoreci.com/blog/2014/01/14/rails-testing-antipatterns-fixtures-and-factories.html)
