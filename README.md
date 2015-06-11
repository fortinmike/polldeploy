# polldeploy

Polls services for artifacts, then downloads and deploys them on the local machine.

## Installation

    $ gem install polldeploy

## Supported Platforms and Services

polldeploy has limited platform and services support at the moment:

- Windows (Tested on Windows 7+)
- TeamCity (Tested with TeamCity 9.X)

However, its architecture facilitates the creation of new sources and the only thing that currently makes it platform-specific is the win32-service gem, which registers a Windows service that performs sources polling.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
