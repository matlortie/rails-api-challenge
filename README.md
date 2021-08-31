# README

This project is hosted on Heroku at: [https://rails-rest-challenge.herokuapp.com](https://rails-rest-challenge.herokuapp.com)

### To run the project locally 
* clone the repo
* install gems with `bundle install`
* using postgresql for database, [install](https://www.postgresql.org/download/) it if you don't already have it
* create the database with `rails db:create`
* run the migrations `rails db:migrate`
* seed the database from the provided csv file `rails db:seed`

Tests are using RSPEC, run them with `bundle exec rspec`

# USAGE

Root URL of the API is [https://rails-rest-challenge.herokuapp.com](https://rails-rest-challenge.herokuapp.com)

### `GET` `/pokemons`
Returns the paginated list of all Pokemons in the database

optional params can be put in query params like this `/pokemons?page=2&per_page=5` or in the request body:
```json
{
  "page": 2, // default => 1
  "per_page": 5 // default => 25
}
```

### `GET` `/pokemons/:id`
Returns the Pokemon with the specified id

### `POST` `/pokemons`
Creates a new Pokemon

Request body:
```json
{
  "name": "Pokemon Name", // REQUIRED, String
  "number": 801, // Optional, Integer
  "type_1": "Type", // Optional, String, default => "Normal"
  "type_2": null, // Optional, String
  "total": 300, // Optional, Integer, default => 300
  "hp": 50, // Optional, Integer, default => 50
  "attack": 40, // Optional, Integer, default => 40
  "defense": 40, // Optional, Integer, default => 40
  "sp_atk": 60, // Optional, Integer, default => 60
  "sp_def": 50, // Optional, Integer, default => 50
  "speed": 50, // Optional, Integer, default => 50
  "generation": 1, // Optional, Integer, default => 1
  "legendary": false // Optional, Bool, default => false
}
```

### `PUT` `/pokemons/:id`
Updates the given pokemon, add the fields you want to update in the request body

### `DELETE` `/pokemons/:id`
Deletes the given Pokemon from the database