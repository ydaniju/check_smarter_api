## CheckSmarter-Api

[![CircleCI](https://circleci.com/gh/andela-ydaniju/check_smarter_api.svg?style=svg)](https://circleci.com/gh/andela-ydaniju/check_smarter_api) [![Coverage Status](https://coveralls.io/repos/github/andela-ydaniju/check_smarter_api/badge.svg?branch=ft-app-scaffold-120910119)](https://coveralls.io/github/andela-ydaniju/check_smarter_api?branch=ft-app-scaffold-120910119)


## Features

## Dependencies

User authentication is implemented with the JWT gem. For more information, see https://github.com/jwt/ruby-jwt

Service objects were implemented by extending the SimpleCommand gem. See https://github.com/nebulab/simple_command

JBuilder was used while serializing objects for JSON responses. 

Devise for authentication

## Installation

Web application is written with Ruby using the Ruby on Rails framework.

To install Ruby visit [Ruby Lang](https://www.ruby-lang.org). [v2.3.0p0]

To install Rails visit [Ruby on Rails](http://rubyonrails.org/). [v5.0.0.beta3]


##API endpoints.

| EndPoint                                                |   Functionality                      |
| --------------------------------------------------------| ------------------------------------:|
| POST api/v1/users                                       | Signs user up                        |
| PUT api/v1/users/:id                                    | Updates a user                       |
| GET api/v1/users/:id                                    | Shows user profile                   |
| DELETE api/v1/users/:id                                 | Delete user profile                  |
| POST /users/login                                       | Logs a user in                       |
| POST /api/v1/users/:user_id/checklists                  | Creates a new checklist              |
| GET /api/v1/users/:user_id/checklists                   | Lists all the created checklists     |
| GET /api/v1/users/:user_id/checklists/:id               | Gets single checklist                |
| PUT /api/v1/users/:user_id/checklists/:id               | Updates this checklist               |
| DELETE /api/v1/users/:user_id/checklists/:id            | Deletes this single checklist        |



## Testing

Before running tests, run the following command to run all database migrations:

        $ bundle exec rake db:migrate

To test the web application, run the following command to carry out all tests:

        $ bundle exec rake test


## Contributing

1. Fork it by visiting - https://github.com/andela-ydaniju/check_smarter_api

2. Create your feature branch

        $ git checkout -b new_feature
    
3. Contribute to code

4. Commit changes made

        $ git commit -a -m 'descriptive_message_about_change'
    
5. Push to branch created

        $ git push origin new_feature
    