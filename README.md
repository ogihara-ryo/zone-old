# Zone

## Description

This Ruby on Rails application is developed for programmers to easily enter the zone.  
Details are described in the [Wiki](https://github.com/ogihara-ryo/zone/wiki). (Japanese)

## Features

- Pomodoro technique
- Daily task management

## Requirement

- Ruby 2.4.0
- Rails 5.0.0

It will follow the latest version

## Installation

```console
$ git clone git@github.com:ogihara-ryo/zone.git
```

## Database creation

```console
$ cp config/database.yml.example config/database.yml
$ bundle install
$ rails db:create
$ rails db:migrate
```

## Run the test suite

```console
$ rspec spec/
```

## Author

Ogihara Ryo

- [GitHub](https://github.com/ogihara-ryo)
- [Twitter (@OgiharaRyo)](https://twitter.com/OgiharaRyo)
- [Facebook](https://www.facebook.com/ryo.ogihara.5)

## License
[MIT License](https://github.com/ogihara-ryo/zone/blob/master/LICENSE)
