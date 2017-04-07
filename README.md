# Bytely
#### A URL shortener
#### Technologies: Ruby on Rails, React, Bootstrap, Rspec, Capybara

## Index
* [Task](#Task)
* [Installation](#Install)
* [Usage](#Usage)
* [User Stories](#Stories)
* [Approach](#Approach)
* [Extensions](#Extensions)

Here's the live version on Heroku: [Bytely](https://byte1y.herokuapp.com/)

## <a name="Task">Task</a>
To create a URL shortener webapp, instructions [here](https://github.com/makersacademy/url_shortener_tech_test)

The app utilises a rails backend as an api which provides data in the form of JSON objects to the react front end.

## <a name="Install">Installation</a>
* Clone from github
```
$ git clone https://github.com/BenJohnCarson/bytely.git
```

* Switch to ruby 2.2.3
```
$ rvm use 2.3.3
```

* Install gems
```
$ gem install bundler
$ bundle
```

## <a name="Usage">Usage</a>

* To run the app
```
rails s
```
Navigate to http://localhost:3000

* Running tests

Install phantomJS for the poltergeist driver, instructions [here](https://github.com/teampoltergeist/poltergeist)

```
$ rspec
```

Currently there's a bug when running all tests, capybara/poltergeist timeout error. 
I believe it's something to do with it moving onto the next spec for an ajax call can be completed.
To avoid run spec files individually.

## <a name="Stories">User Stories</a>
```
As a lazy web user
So that I don't have to type out long urls
I would like to convert my long original urls to shorter ones

As a lazy web user
So that I use short urls I've previously made
I would like to see a table of urls

As a lazy web user
So that I can see how popular my short urls are
I'd like to see some stats for each of my short urls
```

## <a name="Approach">Approach</a>
To approach this challenge, I first broke it down into several user stories.
Next I did some rough hand drawn mockups of what I expected the landing page to look like.
I then dedicated some time to researching/learning React, as it was a completely new technology for me.
Once I'd done enough research, I started work on the first user story.
This involded writing feature tests for what I expected to see upon visiting the website.
This drove me to start work on the back end by creating a url model that could be stored in the database.
The url model has methods to create the short code and short url, and stores them along with the original url, number of visits and the date of the last visit.
The information stored in the database is provided to the react frontend by a JSON object rendered by the controller.
This controller method is called by an ajax call in the main frontend component, BytelyApplication.
This information is passed down to the other components whos responsibility is to present it on the page.


## <a name="Extensions">Extensions</a>
Given more time, there are several things I'd like to extend upon

* Provide more detailed stats information
    * Move the visits and date\_last\_visted attributes of url into a seperate visit model
    * This would allow the url to have many visits to display, with the date and time of each one
* Enhance the look
    * Make css transition and fadein so that the stats table appears more naturally
    * Add a hide button to remove the stats table
* Allow ordering of visits by parameters such as date added, most visited etc
* Add searching for individual urls
* Clean up the url model
    * Make better use of the encode and decode methods rather than storing short\_url and short\_code in the database
* Add a method to sanitze urls before saving, to prevent multiple entries where different urls point to the same page e.g. ```https://www.google.co.uk/?gws_rd=ssl``` and ```https://www.google.co.uk``` both redirect to google
