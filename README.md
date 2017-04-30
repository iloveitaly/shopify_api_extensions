# Shopify API Extensions

Adds some helpful functionality to the shopify API ruby gem:

* Backoff support for network errors and rate limiting
* Pagination support ala Stripe's `auto_paging_each`
* Some helpful convenience methods on various objects

Links:

* [Official Shopify API](https://rubygems.org/gems/shopify_api)
* https://github.com/Shopify/shopify_api/pull/339

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shopify_api_extensions'
```

## Usage

```ruby
ShopifyAPI::Product.auto_paging_each do |product|
  puts "#{product.id}"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/iloveitaly/shopify_api_extensions.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
