# Everything::Piece::Find
[![Gem Version](https://badge.fury.io/rb/everything-piece-find.svg)](http://badge.fury.io/rb/everything-piece-find)
[![Build Status](https://travis-ci.org/kyletolle/everything-piece-find.svg?branch=master)](https://travis-ci.org/kyletolle/everything-piece-find)

You'll need [everything-core](https://github.com/kyletolle/everything-core)
before you can use this.

This adds a `#find` to `Everything::Piece`. This allows you to find a piece
within your `everything` repo by name, instead of by the full path. This only
works for pieces at the root of your everything repo.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'everything-piece-find'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install everything-piece-find

## Usage

```
require 'everything'
require 'everything-piece-find'

piece = Everything::Piece.find('name-of-your-piece')

# Now you can use the piece as you normally would.
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/kyletolle/everything-piece-find. This project is intended to
be a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code of
conduct.


## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).

