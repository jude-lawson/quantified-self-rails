# Quantified Self Rails API

[![Waffle.io - Columns and their card count](https://badge.waffle.io/jude-lawson/quantified-self-express.svg?columns=all)](https://waffle.io/jude-lawson/quantified-self-express)

## Summary

Quantified Self Rails API is an Rails api built for serving a Meal Diary interface. The frontend for that meal diary can be found [here](https://jude-lawson.github.io). The backend API is hosted at [here](https://sleepy-cove-82173.herokuapp.com/). 

The api keeps track of foods and their calorie counts and relates those foods to specific meals (breakfast, lunch, snack, or dinner).

### Endpoints

`GET /api/v1/foods`
- Returns all foods currently in the database
- Payload:
```javascript
[
  {
    id: 1,
    name: 'Banana',
    calories: 100
  },
  {
    id: 2,
    name: 'Cookie',
    calories: '300'
  }
]
```

`GET /api/v1/foods/:id`
- Returns a single food with the provided id from the database
- Payload:
```javascript
{
  id: 12,
  name: 'Cookie',
  calories: 300
}
```

`POST /api/v1/foods`
- Adds a food to the database
- Receives a object (converted to JSON) like the one below:
```javascript
{
  food: {
    name: 'Dumplings',
    calories: 900
  }
}
```

`PATCH /api/v1/foods/:id`
- Updates the food with the given id in the database
- Receives and object (converted to JSON) like the one below:
```javascript
{
  food: {
    name: 'Flax Seed'
    calories: 50
  }
}
```

`DELETE /api/v1/foods/:id`
- Removes the food specified by the id from the database and associated meals
- If the food item is not found, a 404 will be returned

`GET /api/v1/meals`
- Returns all meals and their associated foods
- Payload:
```javascript
[
  {
    id: 1,
    name: 'Breakfast',
    foods: [
      {
        id: 1,
        name: 'Strawberries'
        calories: 200
      }
    ]
  },
  {
    id: 2
    name: 'Lunch'
    foods: [
      {
        id: 3,
        name: 'Sandwich'
        calories: 600
      },
      {
        id: 4,
        name: 'Chips'
        calories: 800
      }
    ]
  }
]
```

`GET /api/v1/meals/:meal_id/foods`
- Returns all of the associated foods for a specified meal
- Payload:
```javascript
{
  id: 2
  name: 'Lunch'
  foods: [
    {
      id: 3,
      name: 'Sandwich'
      calories: 600
    },
    {
      id: 4,
      name: 'Chips'
      calories: 800
    }
  ]
}
```

`POST /api/v1/meals/:meal_id/foods/:id`
- Adds a food to a specified meal
- Returns the following message with a 201 status if successful
```javascript
{
  message: 'Successfully added <food> to <meal>'
}
```
- Returns a 404 if the specified food or meal cannot be found


`DELETE /api/v1/meals/:meal_id/foods/:id`
- Removes the specified food from the specified meal
- Returns a 404 if the specified food or meal is not found
- Return the following message with a 201 status if successful
```javascript
{
  message: 'Successfully removed <food> from <meal>'
}
```


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
