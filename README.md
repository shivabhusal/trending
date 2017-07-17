# Trending
A Ruby on Rails based web app to find tweets on topics you choose. Admins will have a text-box in admin 
panel where they can put comma separated values of terms/tags to be searched.

It will periodically fetch tweets from Twitter about those topics and categorizes them according to the location 
of the respective authors.

Default tags would be
- `#Nepal`
- `#Kathmandu`

# Authentication
Will will get Authenticated using OAuth2 to Twitter. An Authenticated user will be able to click on the tags, 
which will lead them to the page with locations of Authors. Clicking on the location will lead to 
tweets mentioning the `tag`. 

* Ruby version
MRuby version `2.4+` will be supported.

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...