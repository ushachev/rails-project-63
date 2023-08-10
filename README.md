### Hexlet tests and linter status:
[![Actions Status](https://github.com/ushachev/rails-project-63/workflows/hexlet-check/badge.svg)](https://github.com/ushachev/rails-project-63/actions)
[![CI](https://github.com/ushachev/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/ushachev/rails-project-63/actions/workflows/main.yml)

# HexletCode

The form generator is a library with which it is convenient to create forms in site templates.

### Requirements

- Ruby 3.2.2
- Make

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add ipgeobase --github=https://github.com/ushachev/rails-project-63.git

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install specific_install
    $ gem specific_install https://github.com/ushachev/rails-project-63.git

## Usage

```ruby
User = Struct.new(:id, :name, :job)

user = User.new

html = HexletCode.form_for user, url: '/users' do |f|
  f.input :name
  f.input :job, as: :text
  f.submit
end

puts html

# <form action="/users" method="post">
#   <label for="name">Name</label>
#   <input name="name" value="" type="text">
#   <label for="job">Job</label>
#   <textarea cols="20" rows="40" name="job"></textarea>
#   <input type="submit" value="Create">
# </form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ushachev/rails-project-63.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
