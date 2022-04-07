# datashake-ruby-sdk

An API wrapper written in ruby for Datashake API
https://docs.datashake.com/

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add datashake-ruby-sdk

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install datashake-ruby-sdk

## Usage

```
client = Datashake::ReviewScaper::Client.new(token: 'your-api-token')
client
  .add
  .url("https://www.amazon.com/dp/B003YH9MMI")
  .fetch
  ```

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/reviewshake/datashake-ruby-sdk.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
