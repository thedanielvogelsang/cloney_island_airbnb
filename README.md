# Cloney Island Airbnb

![Alt text](https://github.com/rongxanh88/cloney_island_airbnb/blob/development/app/screen_shots/first_homepage_shot.png?raw=true "Cloney Island Airbnb Homepage")
This Cloney Island repo is a brownfield development project received from a [previous Turing school project](https://github.com/rongxanh88/cloney_island_airbnb)
 The brownfield assignment was to fix pending bugs; mild stylization/conversion polishes and unification of code languages; and finally the addition of a few new features: a Twilio phone authenitcation method; an airbnb-api-populated listing index; a dynamic map which uses ajax/jquery to populate a MapBox map. Some of the final features included are:

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


### Prerequisites to Run Locally

  * [Rails version 5.1.2](http://installrails.com/)

  * [Ruby version 2.3.1](https://www.ruby-lang.org/en/documentation/installation/)

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

### Running Locally

  * Clone this repo.
  * cd into it
  * ```bundle install```
  * ```rake db:schema:load```
  * ```rake db:setup```
  * ```rails server```
  * visit ```localhost:3000```

 **To populate with unregistered, local database records:**
  * ```rake import:all```

### Built With

 * Rails, Ruby, ActiveRecord, HTML, CSS, Sass, ERB, Haml, Postgresql, Twilio, ActionCable, OmniAuth Facebook

### To Run the Automated Rspec Test Suite

 * Simply input rspec from the command line

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
