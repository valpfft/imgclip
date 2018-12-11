# Imgclip

A simple gem with a native C extension, that allow storing images from clipboard directly into the file.

## Installation

gtk is required since extension uses gtk library to retrieve image from clipboard.

```ruby
gem 'imgclip'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install imgclip

## Usage

``` ruby
require "imgclip"
Imgclip.clipboard_to_file PATH #=> returns path or exception
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vmikhaliuk/imgclip. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Imgclip project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/vmikhaliuk/imgclip/blob/master/CODE_OF_CONDUCT.md).
