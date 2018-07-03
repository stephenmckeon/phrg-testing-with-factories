# Test Factories

We just learned about using `RSpec` test doubles to facilitate setuping up your tests. But sometimes using a `double` is not enough. There are times in our tests where we want to use an actual objects from our application.

As an application grows, a common problem with creating application objects on the fly is that they become complex. A `User` object may require a password, a territory, a role, a user_title, etc. And these requirement typically have model validations that ensure these are present.

When a `user_spec` is testing an isolated unit of functionality, like assigning a `user`'s TShirt size, then adding these necessary fields to your `User` object becomes a chore. It is also a distraction from the intent of the test. A test that is designed to assert behavior around TShirt size should not have anything to do with a role or password.

Enter test factories.

![Factory](https://raw.githubusercontent.com/powerhome/phrg-testing-with-factories/master/factory.jpg?raw=true "Factory")

## What is a Test Factory

A factory is a blueprint that allows us to create an object, or a collection of objects, with predefined sets of values. Factories let us maintain simple definitions in a single place, but also allow us to manage all data related to the test itself when we need to.

The standard library to create factories in `Rails` is called [`FactoryBot`](https://github.com/thoughtbot/factory_bot) (formerly called `FactoryGirl`).

## Examples with FactoryBot

## Complex examples with FactoryBot

## Example from Nitro?

## Lab that only setups basic factories?

## Resources

- [FactoryBot on Github](https://github.com/thoughtbot/factory_bot)
- [Working Effectively With Data Factories Using FactoryBot](https://semaphoreci.com/community/tutorials/working-effectively-with-data-factories-using-factorybot)
- [Rails Testing Antipatterns: Fixtures and Factories](https://semaphoreci.com/blog/2014/01/14/rails-testing-antipatterns-fixtures-and-factories.html)
