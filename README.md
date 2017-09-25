# Cloney Island Airbnb

To explore this app on Heroku:

![Alt text](https://github.com/rongxanh88/cloney_island_airbnb/blob/development/app/screen_shots/first_homepage_shot.png?raw=true "Cloney Island Airbnb Homepage").

This Cloney Island repo is a brownfield development project received from a [previous Turing school project](https://github.com/rongxanh88/cloney_island_airbnb). The brownfield assignment was to fix pending bugs; mild stylization/conversion polishes and unification of code languages; and finally the addition of a few new features: a Twilio phone authenitcation method; an airbnb-api-populated listing index; a dynamic map which uses ajax/jquery to populate a MapBox map. Some of the final features included are:

  * Test Driven Development
  * Tracking workflow on Pivotal Tracker
  * Supporting multitenancy
  * Using OAuth for user authentication
  * Creating a rake task that loads enough objects to create a somewhat realistic scale for production
  * Serving up an internal API
  * Using Javascript to update pages dynamically
  * Incorporating Twilio as a secondary authentication tool.
  * Incorporating Action Cable to create real-time messaging.
  * Using MapBox to populate a map of listings based on search bar entry of city or zipcode

This project was re-developed by a group of 4 developers over a 10 day sprint.

## Getting Started

### Prerequisites to Run Locally
Rales Engine is a Ruby on Rails application that requires both Ruby and Rails to be installed on your machine

Ruby:
From your bash run:
  ```
  ruby -v
  ```

You should see something similar to:
  ```
  ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin16]
  ```

Rails:
Follow a similar process for Rails:
  ```
  rails -v
  ```

You should see something similar to:
  ```
  Rails 5.1.3
  ```
If Ruby or Rails is not installed on your machine, consult the following links:

  * [Rails version 5.1.2](http://installrails.com/)

  * [Ruby version 2.3.1](https://www.ruby-lang.org/en/documentation/installation/)

After ensuring you have Ruby and Rails installed, clone this project to your desired directory:

  ```
  git clone git@github.com:thedanielvogelsang/cloney_island_airbnb.git

  ```

  Change directory to rales_engine:
  ```
  cd cloney_island_airbnb
  ```

  Bundle:
  ```
  bundle install
  ```

### Install Figaro

  * From the command line, input `bundle exec figaro install`. This command will create an application.yml file within the config directory to store all sensitive data. Use config/application.yml to store your passwords/secrets/api-keys as follows:

### Syncing with Facebook

  * In order to use Facebook Oauth to authenticate users, you must register the app with facebook, and obtain a Facebook App_Id and Secret, here:
  [Facebook Register](https://developers.facebook.com/docs/apps/register/)

    Once you've registered the app, store your id and secret like so:  

    `facebook_app_id: '1XXXXXXXXXXXXX'
    facebook_app_secret: '3XXXXXXXXXXXXXXXXXXXXXXXXXXX'`

### Add Airbnb_key and GoogleMaps API-key to application.yml
  * add the following code to your yml file:
    `airbnb_key: "d306zoyjsyarp7ifhu67rjxn52tv0t20"`
    `google_maps_api_key:  "AIzaSyC3Lh_RRFtmA8eTsVlpBzP82j1BIjC80Bo"`

### Sync with MapBox:
  * Sign up for a Mapbox account and obtain your own API access token per instructions here:
    [MapBox-Access-Tokens](https://www.mapbox.com/help/how-access-tokens-work/)

    Once you have an api key, add it to the yml file like so:

    `MAPBOX_API_KEY: 'pk.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'`


### Syncing with Twilio

  * Sign Up with a Trial Twilio Account here:
  [Try-Twilio](https://www.twilio.com/try-twilio)

  Set up a trial phone number on the Twilio website. Also provide a phone number that will be used as the phone to communicate with in development. Go to the console section and copy both the account SID and auth token. Inside of the config/application.yml file, (it may be hidden depending on your text editor and its current settings) enter the keys with the following environment variables:

  TWILIO_ACCOUNT_SID: '#############################'  
  TWILIO_AUTH_TOKEN: '############################'  
  TWILIO_NUMBER: '+1 720-###-####'

Once this is complete, your application should be able to send a verification code to the phone number provided on the Twilio website.

## Launching Cloney Island

### Running Locally
(If you're running on a newer version of ruby, prepend these commands with `bundle exec`)

  * ```rake db:create```
  * ```rake db:migrate```
  * ```rails server```
  * visit ```localhost:3000```

 **To populate with unregistered, local database records:**
 (before running the server)
  * ```rake import:all```

### Built With

 * Rails, Ruby, ActiveRecord, HTML, CSS, Sass, ERB, Haml, Postgresql, Twilio, ActionCable, OmniAuth Facebook


## Round 1 Authors

* **Adam Gunther** - [Github](https://github.com/adamgunther1)
* **William Thomas** - [Github](https://github.com/wthoma22)
* **Padraic O'Neill** - [Github](https://github.com/podoglyph)
* **Bao Nguyen** - [Github](https://github.com/rongxanh88)
* **Benjamin Ross** - [Github](https://github.com/Benja-Ross)

## Round 2 Authors

* **Daniel Vogelsang** -- [Github](https://github.com/thedanielvogelsang)
* **Chantal Justamond** -- [Github](https://github.com/chantal66)
* **Jean-Francois Lalonde** -- [Github](https://github.com/JF-Lalonde)
* **Jim Szalewski** -- [Github](https://github.com/jimszalew)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Turing School of Software & Design

[![Build Status](https://semaphoreci.com/api/v1/rongxanh88/cloney_island_airbnb/branches/development/shields_badge.svg)](https://semaphoreci.com/rongxanh88/cloney_island_airbnb)
