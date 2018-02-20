# MM-API
[![Maintainability](https://api.codeclimate.com/v1/badges/eb17d622473ddeb12730/maintainability)](https://codeclimate.com/github/rjhancock/mm-api/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/eb17d622473ddeb12730/test_coverage)](https://codeclimate.com/github/rjhancock/mm-api/test_coverage) [![Build Status](https://travis-ci.org/rjhancock/mm-api.svg?branch=master)](https://travis-ci.org/rjhancock/mm-api)

API Service for the MegaMek(https://megamek.org) BattleTech Java game for
handling various automated functions such as server availability and list
generation.

## For deployment
The following files need to be renamed and edited for local use or for server
deployment by removing the .example.

* ansible/templates/devise.rb.example (deployment)
* ansible/templates/smtp_settings.rb.example (deployment)
* config/initializers/devise.rb.example
