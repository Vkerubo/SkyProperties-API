# Property Management Backend REST API

This is a backend REST API for a property management application. The API has endpoints for managing sellers, buyers, properties, and favorites. Users can log in to access some of the endpoints.

## Technologies Used

- Ruby on Rails
- PostgreSQL
- JWT

## Endpoints

### Sellers

- _GET_ `/sellers`: Get all sellers
- _GET_ `/sellers/:id`: Get a seller by ID
- _POST_ `/sellers`: Create a new seller
- _PUT_ `/sellers/:id`: Update a seller by ID
- _DELETE_ `/sellers/:id`: Delete a seller by ID

### Buyers

- _GET_ `/buyers`: Get all buyers
- _GET_ `/buyers/:id`: Get a buyer by ID
- _POST_ `/buyers`: Create a new buyer
- _PUT_ `/buyers/:id`: Update a buyer by ID
- _DELETE_ `/buyers/:id`: Delete a buyer by ID

### Properties

- _GET_ `/properties`: Get all properties
- _GET_ `/properties/:id`: Get a property by ID
- _POST_ `/properties`: Create a new property
- _PUT_ `/properties/:id`: Update a property by ID
- _DELETE_ `/properties/:id`: Delete a property by ID

### Favorites

- _GET_ `/favorites`: Get all favorites
- _GET_ `/favorites/:id`: Get a favorite by ID
- _POST_ `/favorites`: Create a new favorite
- _PUT_ `/favorites/:id`: Update a favorite by ID
- _DELETE_ `/favorites/:id`: Delete a favorite by ID

### Authentication

- _POST_ `/login`: Log in and get a JWT token

### Users

- _POST_ `/users`: Create a new user
- _GET_ `/profile`: Get the current user's profile

## Authentication

To access some of the endpoints, users must log in and provide a JWT token in the request headers.

## Database Schema

The database schema consists of four tables: `sellers`, `buyers`, `properties`, and `favorites`. The `properties` table has a foreign key to `sellers` and a many-to-many relationship with `buyers` through `favorites`. The `favorites` table has foreign keys to both `buyers` and `properties`.

## Installation

1. Clone this repository
2. Run `bundle install` to install dependencies
3. Run `rails db:create` to create the database
4. Run `rails db:migrate` to run the database migrations
5. Run `rails db:seed` to seed the database with sample data
6. Run `rails server` to start the server

## Conclusion

This API provides basic functionality for managing sellers, buyers, properties, and favorites. It can be extended and customized to suit the needs of a property management application.
