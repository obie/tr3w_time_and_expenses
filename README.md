# Welcome to The Rails 3 Way

This is a sample application that will help you follow along in the book.


# Issues

* Assuming OS X 10.6.4
* Lots of Rails, RSpec, and Bundler things are in flux, as well as Ruby 1.9.
* This app should work under Ruby 1.8.7-p299 and Ruby 1.9.2.rc1
* You need mysql 5.1.41 if running Ruby 1.9.2.rc1 (to avoid seg faults)


# Setup

For now:

* `gem install bundler --pre`
* `gem install rails --pre`
* `gem install rspec-rails --pre`
* `gem install ruby-debug#19` #remove the comment before '19' if on Ruby 1.9
* `bundle install`
* `rake test && rake spec` #to run the tests
