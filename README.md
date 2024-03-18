# What's in my Food

### Versions

Ruby 3.2.2

Rails 7.1.2

### Setup

- Fork and Clone this repo
- `bundle install`
- `rails db:{create,migrate}`
- `rails s`

We will be querying the FoodData Central API with an ingredient to retrieve a list of the ten most relevant foods that include that ingredient.

## Assessment Instructions

First, sign up for an API key here: https://fdc.nal.usda.gov/api-key-signup.html

The documentation for the API can be found here: https://fdc.nal.usda.gov/api-guide.html

Familiarize yourself with the API - set up some sample requests in Postman, and you may want to set up your API Key Credentials in this repository, install any gems you'll use, etc. 

When the mid-mod assessment starts, your instructors will send you a user story. It will be your job to complete that user story within the 2-hr timeframe. Therefore, make sure you take the time to read the API documentation carefully. This repository has been set up with a root route `/` that goes to the `WelcomeController`, where a form is rendered: `welcome/index.html.erb`. This route & path will be used as part of the user story - *do not remove it*. 
