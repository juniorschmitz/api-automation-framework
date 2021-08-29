# Excon Automated Tests Simple Template

[![CI](https://github.com/juniorschmitz/excon-automation-simple-template/actions/workflows/main.yml/badge.svg)](https://github.com/juniorschmitz/excon-automation-simple-template/actions/workflows/main.yml)

A template created for implementing automated tests focusing on API using Excon as the REST client.

The documentation for the tested API can be found at: https://serverest.dev

The framework uses:
```
- Rspec;
- Cucumber;
- Excon;
- Faker;
```

It uses send methods from Ruby for reusing steps with more powerful implementation, and has methods already implemented as examples for the ServeRest API.

Some of the main capabilities of the framework are:
- Generic and Dynamic data generation using Faker for the automated tests;
- Utilities for logging the infos from and to applications;
- Easy to understand implementation using the Excon client for making HTTP calls;
- Easy to use Features/Steps/Hooks for implementing new scenarios or migrating and creating new tests for any kind of REST APIs;
- Contract tests using Json Schema validators;

As examples on implementation, in the project there are:
- 23 scenarios covering the /usuarios endpoint;
- 3 scenarios covering the /login endpoint;
- 1 scenario covering the /products endpoint;

Enjoy, any doubt, feel free to contact me.
