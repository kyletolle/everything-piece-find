# Everything::Piece::Find
[![Gem Version](https://badge.fury.io/rb/everything-piece-find.svg)](http://badge.fury.io/rb/everything-piece-find)
[![Build Status](https://travis-ci.org/kyletolle/everything-piece-find.svg?branch=master)](https://travis-ci.org/kyletolle/everything-piece-find)
[![Code Climate](https://codeclimate.com/github/kyletolle/everything-piece-find/badges/gpa.svg)](https://codeclimate.com/github/kyletolle/everything-piece-find)
[![Dependency Status](https://gemnasium.com/kyletolle/everything-piece-find.svg)](https://gemnasium.com/kyletolle/everything-piece-find)

You'll need [everything-core](https://github.com/kyletolle/everything-core)
before you can use this.

This adds finder methods to `Everything::Piece`. This allows you to find pieces
within your `everything` repo by name, instead of by the full path. Check the
Usage section below for details.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'everything-piece-find'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install everything-piece-find

Note: If you're using Bundler to automatically include your gems, you can do
this in the gemfile:

```ruby
gem 'everything-piece-find', require: 'everything/piece/find'
```

## Usage

```ruby
require 'everything'
require 'everything/piece/find'
```

Now you have access to `Everything::Piece.find_by_name` and
`Everything::Piece.find_by_name_recursive`. Once you've found the piece, you can
use it like normal.

### #find_by_name

```ruby
piece = Everything::Piece.find_by_name('name-of-your-piece')
piece.full_path
# => /your/everything/repo/name-of-your-piece
```

### #find_by_name_recursive

```ruby
piece_in_nested_sub_folder =
  Everything::Piece.find_by_name_recursive('another-piece-of-yours')
piece_in_nested_sub_folder.full_path
# => /your/everything/repo/and/some/sub/folders/another-piece-of-yours
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

