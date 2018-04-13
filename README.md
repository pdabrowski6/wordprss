# The WordpRSS Ruby gem

A simple interface for pulling a RSS feed of any blog with the wordpress engine

## Installation
    gem install wordprss

## Usage Examples

All you have to do is to subscribe to a given RSS feed and then you can access its data:

```ruby
feed = WordpRSS::Channel.subscribe("http://pdabrowski.com/blog")
```

If you are not sure if the given blog is a wordpress engine, you can check this before subscribing to the channel:

```ruby
WordpRSS::Channel.wordpress_rss_feed?("http://pdabrowski.com/blog")
```

**Access feed data**

You can access the feed attributes:

```ruby
feed.title # => "Ruby on Rails and Stuff by Paweł Dąbrowski"
feed.description # => "Web development with Ruby on Rails"
```

**Access feed items**

Each feed have 10 items by the default:

```ruby
items = feed.items
items.size # => 10

last_article = items.first
last_article.title # => "3 things that slow down and make your RSpec tests worse"
last_article.link # => "http://pdabrowski.com/blog/ruby-on-rails/testing/3-things-that-slow-down-and-make-your-rspec-tests-worse/"
last_article.published_at # => "Wed, 21 Mar 2018 05:25:15 +0000"
last_article.creator # => "Paweł Dąbrowski"
last_article.description # => "There are a lot of things that can slow down your tests &#8211; some of them are related to your code and some not."
last_article.tags # => ["Ruby on Rails", "RSpec"]
```

## Supported Ruby Versions
This gem was tested on the 2.5.0 version. If it's not working with older versions please add a new issue.

## Copyright
Copyright (c) 2018 Paweł Dąbrowski.
See [LICENSE][] for details.

[license]: LICENSE.md
