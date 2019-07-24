# Rails API example

This is a super basic Rails CRUD JSON API _nested resource version_

# Instructions

```sh
# in a suitable directory
> git clone https://github.com/dearshrewdwit/rails-api-example.git
> cd rails-api-example
> bundle install
```
Let's set up the database with some data:
```sh
# EITHER separately
> bin/rails db:create
> bin/rails db:migrate
> bin/rails db:seed

# OR all in one go:
> bin/rails db:setup
```
Let's now run the app to so that it can listen for requests and send JSON back.
```sh
> bin/rails server
```
Note the default port `3000`

In a separate terminal shell make a [curl][1] request or use [postman][2]

## Rails Routes

`config/routes.rb` this is where we declare routes. One of the ways Rails makes this easy is by providing a helper method `resources`




## Create

POST requests map to the `create` controller action
```sh
# success
> curl -d "player[name]=ed&player[age]=27&player[prize_money]=10&player[titles]=5&player[grand_slams]=2" -X POST http://localhost:3000/api/players
> {"player":{"id":3,"prize_money":10,"name":"ed","age":27.0,"titles":5,"grand_slams":2,"created_at":"2017-11-18T21:04:40.149Z","updated_at":"2017-11-18T21:25:52.222Z"}}

# failure
> curl -d "player[prize_money]=0" -X POST http://localhost:3000/api/players
> {"errors":{"name":["can't be blank"],"age":["can't be blank"],"titles":["can't be blank"],"grand_slams":["can't be blank"]}}

```

## Read

GET requests map to `index` or `show` controller actions depending on the URI
```sh
# api/players#index
> curl localhost:3000/api/players
> {"players":[{"id":2,"name":"Roger Federer","age":36.0,"prize_money":110235682,"titles":95,"grand_slams":19,"created_at":"2017-11-15T22:41:46.806Z","updated_at":"2017-11-15T22:41:46.806Z"}]}

# api/titles#index
> curl localhost:3000/api/players/1/titles
> {"titles":[{"id":1,"name":"Wimbledon","title_type":"major","year":2017,"created_at":"2017-12-14T09:14:43.549Z","updated_at":"2017-12-14T09:14:43.549Z","player_id":1}]}

# api/players#show success
> curl localhost:3000/api/players/2
> {"player":{"id":2,"name":"Roger Federer","age":36.0,"prize_money":110235682,"titles":95,"grand_slams":19,"created_at":"2017-11-15T22:41:46.806Z","updated_at":"2017-11-15T22:41:46.806Z"}}

# api/players#show failure
> curl localhost:3000/api/players/5
> {"errors":["Couldn't find Player {id: 5}"]}
```

## Update

PATCH requests map to the `update` controller action
```sh
# success
> curl -d "player[prize_money]=123456" -X PATCH http://localhost:3000/api/players/3
> {"player":{"id":3,"prize_money":123456,"name":"ed","age":27.0,"titles":5,"grand_slams":2,"created_at":"2017-11-18T21:04:40.149Z","updated_at":"2017-11-18T21:25:52.222Z"}}

# failure
> curl -d "player[prize_money]=" -X PATCH http://localhost:3000/api/players/3
> {"errors":{"prize_money":["can't be blank"]}}

```
## Destroy

DELETE requests map to the `destroy` controller action
```sh
# success
> curl -X DELETE http://localhost:3000/api/players/2
> {"player":{"id":2,"name":"Roger Federer","age":36.0,"prize_money":110235682,"titles":95,"grand_slams":19,"created_at":"2017-11-15T22:41:46.806Z","updated_at":"2017-11-15T22:41:46.806Z"}}
```

[1]: https://curl.haxx.se/docs/httpscripting.html#GET
[2]: https://www.getpostman.com/
