# Beatquencher Rails
Welcome to the Beatquencher Ruby on Rails API backend. This contains the resources supplied to [this](https://github.com/wardou2/BeatquencherReact "Beatquencher React") repo, the React.js frontend of this project. Set up this Rails repo first.

## Overview
Beatquencher is a music sequencer featuring fully functional sound synthesis, courtesy of the Tone JS package. It includes the ability to create and manage projects with multiple 'scenes,' or subsections of a project. For example, a project might have a verse scene and a chorus scene. Each instrument in a project has a laundry list of settings that can be tweaked and modded to your heart's desire.

This was bootstrapped with `rails new --api`, and runs on a PostgreSQL DB.

Authentication is performed with Google's OAuth.

## Getting Started
* Clone down this repo & run `bundle install` inside the project folder.
* If you don't have Postgres running locally, install [Postgres.app](https://postgresapp.com/downloads.html).
* Run `rails db:setup && rails db:migrate`.
* Next, run `rails db:seed`.
* Run `rails s` to host on your local machine.
* Test by going to http://localhost:3000/api/v1/users. You should see this:
![API result declaring user not logged in](https://raw.githubusercontent.com/wardou2/BeatquencherRails/master/images/users_api_not_loggedin.png)
* That's good! We haven't logged in yet so the API doesn't want to give up any information. 
* Next you will need to set up the React JS front end: [BeatquencherReact](https://github.com/wardou2/BeatquencherReact "Beatquencher React"). Follow the instructions on the readme for that repo.

## License
This project is licensed under the MIT License - see the LICENSE.md file for details
