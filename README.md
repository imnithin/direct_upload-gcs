# DirectUpload::Gcs

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/direct_upload/gcs`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'direct_upload-gcs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install direct_upload-gcs

## Usage

TODO: Write usage instructions here

DirectUpload::Gcs.new('put', '1/abc.jpeg', 20.minutes, 'image/jpeg', 'bucket_wow', 'lib/key_file.json').signed_url

DirectUpload::Gcs.new(method, file_name, time_in_mins, content_type, bucket, path_to_key_file).signed_url


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/direct_upload-gcs. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DirectUpload::Gcs project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/direct_upload-gcs/blob/master/CODE_OF_CONDUCT.md).

http://andrewvos.com/uploading-files-directly-to-google-cloud-storage-from-client-side-javascript
https://bundler.io/v1.15/guides/creating_gem.html
https://quickleft.com/blog/engineering-lunch-series-step-by-step-guide-to-building-your-first-ruby-gem/
