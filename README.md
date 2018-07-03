# Test Factories

We just learned about using `RSpec` test doubles to facilitate setting up your tests. But sometimes using a `double` is not enough. There are times in our tests where we want to use an actual objects from our application.

As an application grows, a common problem with creating application objects on the fly is that they become complex. A `User` object may require a password, a territory, a role, a user_title, etc. And these requirements typically have model validations that ensure these are present. Which means we can not leave them out everytime we create a `User` instance.

When a `user_spec` tests an isolated unit of functionality, like assigning a `user`'s TShirt size for example, then adding these necessary fields to your `User` object becomes a chore. It is also a distraction from the intent of the test. A test that is designed to assert behavior around TShirt size should not have anything to do with a `user`'s role or password.

Enter test factories.

![Factory](https://raw.githubusercontent.com/powerhome/phrg-testing-with-factories/master/factory.jpg?raw=true "Factory")

## What is a Test Factory

A factory is a blueprint that allows us to create an object, or a collection of objects, with a predefined set of values. Factories let us maintain simple definitions in a single place, but also allow us to manage all data related to the test itself when we need to.

The standard library to create factories in `Rails` is called [`FactoryBot`](https://github.com/thoughtbot/factory_bot) (formerly called `FactoryGirl`). This library has been around a very long time and has a lot of useful features. Because of `FactoryBot`'s age, it has also progressed through a variety of syntaxes. You will discover many advanced features and different syntaxes throughout Nitro's testing factories.

## Examples

## Complex examples with FactoryBot

## Example from Nitro?

## Lab that only setups basic factories?

## Resources

- [FactoryBot on Github](https://github.com/thoughtbot/factory_bot)
- [Working Effectively With Data Factories Using FactoryBot](https://semaphoreci.com/community/tutorials/working-effectively-with-data-factories-using-factorybot)
- [Rails Testing Antipatterns: Fixtures and Factories](https://semaphoreci.com/blog/2014/01/14/rails-testing-antipatterns-fixtures-and-factories.html)
