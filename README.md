# Authentication RS256
[Full Tutorial](https://auth0.com/docs/quickstart/backend/rails/01-authorization)

This example shows how to secure your Rails API using RS256 signed, Auth0-issued JSON Web Tokens.

## Running the Sample Application

In order to run the example you need to have Ruby installed.

You also need to set the Domain, and API Audience for your Rails API as environment variables with the following names respectively: `AUTH0_DOMAIN` and `AUTH0_API_AUDIENCE`.

Set the environment variables in `.env` to match those in your Auth0 API.

````bash
# .env file
AUTH0_DOMAIN="myAuth0Domain"
AUTH0_API_AUDIENCE=myAPIAudience
````
Once you've set these environment variables, run `bundle install` and then `rails s`. You can follow the instructions in the [Full Tutorial](https://auth0.com/docs/quickstart/backend/rails/01-authentication-RS256) to create an access token and then call the secured API endpoint.
__Note:__ Remember that you need to have `./bin` in your path for `rails s` to work.

Shut it down manually with Ctrl-C.

__Note:__ If you are using Windows, uncomment the `tzinfo-data` gem in the gemfile.

## Running the Sample Application With Docker

In order to run the example with docker you need to have `docker` installed.

You also need to set the client credentials as explained [previously](#running-the-sample-application).

Execute in command line `sh exec.sh` to run the Docker in Linux, or `.\exec.ps1` to run the Docker in Windows. 


## Used Libraries
* [Ruby JWT](https://github.com/jwt/ruby-jwt)
