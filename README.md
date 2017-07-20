<img src="http://laura.productions/wp-content/uploads/2015/06/09352fdbe35a23ea367800dbbb95df421.png" width="150">

[![Code Climate](https://codeclimate.com/github/shivabhusal/trending/badges/gpa.svg)](https://codeclimate.com/github/shivabhusal/trending)
[![Issue Count](https://codeclimate.com/github/shivabhusal/trending/badges/issue_count.svg)](https://codeclimate.com/github/shivabhusal/trending)

<a href="#" id="status-image-popup" title="Latest push build on default branch: " name="status-images" class="open-popup" data-ember-action="" data-ember-action-757="757">
          <img src="https://travis-ci.org/shivabhusal/trending.svg?branch=master" alt="build:">
        </a>

# Trending  

A Ruby on Rails based web app to find tweets on topics you choose. If setup properly, Trending will fetch tweets mentioning hash-tags set in database-table 'tags' once a day. Will display the trends in Trend-Chart in the dashbaord. Any user Authenticated via Twitter/Facebook will be able to see/browse the trends per Author-Location.

![](/doc/images/trend_graph.png)


It will periodically fetch tweets from Twitter about those topics and categorizes them according to the location 
of the respective authors.

Default tags would be
- `#Nepal`
- `#Kathmandu`

Admin will be able to add tags.

## Things one can learn from this project
  - OAuth2 authentication using Devise,Twitter
  - Search through Tweets using Twitter API
  - Integrating vendor View-Templates with Sprockets
    - [See this for more info](https://cbabhusal.wordpress.com/2017/07/19/rails-using-bootstrap-templates-in-vendor/)

## Authentication
Users will get authenticated using OAuth2 to Twitter and Facebook. An Authenticated user will be able to click on the tags categorized by author-location, which will show them the timeline of tweets along with the map of the region (if its a valid location).

## Admin
Admin will be able to manipulate data from the control panel. We are using active-admin for that purpose. 

### How To Access
- **Development**
  - goto URL [http://localhost:3000/admin](http://localhost:3000/admin)  
- **In Production**  
  - goto URL [https://trending-today.herokuapp.com/admin](https://trending-today.herokuapp.com/admin)

## Ruby version
MRuby version `2.4+` will be supported.

## System dependencies
  - Cron
    - Used whenever gem to write to cron tab; see `schedule.rb` for more info
    - Cron is supposed to execute the rake task `lib/tasks/fetch_tweets_daily.rake` once every day

## Configuration
  - [See this for configuring twitter for OAuth2](/doc/images/twitter_oauth_localhost.png)
  - Make sure you use URL `http://127.0.0.1:3000` instead of `http://locahost:3000`
  - Use `whenever --update-crontab` to update your cron tab for auto-fetching the tweets once a day

## Database Commands
```ruby
  $ rails db:create
  $ rails db:migrate
  $ rails db:seed
```

* How to run the test suite
```ruby
  $ rspec spec/
```
