soa_integration_testing
=======================

A sample application to demonstrate integration testing Rails [SOA](http://en.wikipedia.org/wiki/Service-oriented_architecture) configured to with:
  1. [remote_factory_girl](https://github.com/tdouce/remote_factory_girl)
  2. [remote_factory_girl_home_rails](https://github.com/tdouce/remote_factory_girl_home_rails)
  3. [remote_database_cleaner](https://github.com/tdouce/remote_database_cleaner)
  4. [remote_database_cleaner_home_rails](https://github.com/tdouce/remote_database_cleaner_home_rails)

## Description
This repo contains one "client" application (`client`) and two "home" applications (`home`
and `home_2`). The `client` application is configured to create test data in two
different "home" applications (`home` and `home_2`).

## Getting Started

### Bootstrap Applications
```
cd soa_integration_testing/ && bin/bootstrap.sh
```

### Run 'client' test suite
Follow instructions output by bootstraping process
