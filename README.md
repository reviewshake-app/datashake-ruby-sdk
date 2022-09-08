# datashake-ruby-sdk

An API wrapper written in ruby for Datashake API
https://docs.datashake.com/

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add datashake-ruby-sdk

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install datashake-ruby-sdk

## Usage

```ruby
client = Datashake::ReviewScaper::Client.new(token: 'your-api-token')

response = client # Add a review profile by url
  .add_profile
  .url("https://www.amazon.com/dp/B003YH9MMI")
  .from_date("2021-01-01")
  .fetch

response.success => true
response.job_id => 346998013
response.status => 200
response.message => "Added this profile to the queue..."

client # Add a review profile by google search query
  .add_profile
  .query("I-80 Towing & Service, 1209 S 3rd St, Laramie, WY 82070, USA")
  .fetch

client.info.job_id(346998013).fetch # Fetch job details

client.reviews.job_id(346998013).page(2).per_page(10).fetch # Fetch reviews for the given job
  ```

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

This gem uses [standardrb](https://github.com/testdouble/standard) for code style. Just write your code and run `bundle exec rake standard:fix`.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/reviewshake/datashake-ruby-sdk.

## Release

Bump the version number in https://github.com/reviewshake/datashake-ruby-sdk/blob/main/lib/datashake-ruby-sdk/version.rb, create a release with github and a tag from the new version number. After doing the github release, build the gem from your commandline with build and push the version rubygems.

Create a release with github

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
