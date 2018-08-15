# Quantified Self Rails API

## Contributing

Pull Requests are welcome!

Please be sure to document the following in your PR:

- If it's a bug, define the expected behavior versus the current behavior
- Document suggested solution
- List changes made, highlighting key changes in functionality
- List any test coverage changes needed

### Setting up for Contribution

- Clone down this repository
```
git clone git@github.com:jude-lawson/quantified-self-rails.git
```

- Run `bundle install` to install necessary dependencies
- Run `rspec` in the project repo to ensure that all tests are passing
- Test file architecture is as follows:
  - All model tests should be in `spec/models` and should be named something like `<model_name>_spec.rb`
  - All endpoint tests should be in `spec/api/v1/requests` and should be named something like `<model_name>_requests_spec.rb`
- Each model should have its own controller nested under `app/controllers/api/v1/`
- Nested resources can have their own folder in `app/controller/api/v1`, such as `highest_calorie_food` being accessed via a `highest_calorie_foods_controller` in `app/controllers/api/v1/meals/highest_calorie_foods_controller.rb`
