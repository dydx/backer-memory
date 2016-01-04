# Backer [In-Memory]

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/backer/memory`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'backer-memory', :github => 'dydx/backer'
```

And then execute:

    $ bundle

## Usage

### Sinatra
1. `require 'backer'` in your main application file
2. `require 'backer/memory'` to specify that you're using the `Memory` adapter
3. Then configure it:
```ruby
configure :development do
  Backer::Repo.register(:user, UserMemoryRepository.new)
end
```

### Models
Models are fairly easy to define, and can be plain Ruby `Struct`s :
```ruby
User = Struct.new(:id, :first, :last, :password)
```

### Repositories
Repositories are also fairly easy to define.
```ruby
class UserMemoryRepository < Backer::Memory::Base
  model_class User
end
```

This defines a new repository named `UserMemoryRepository` that inherits from the `Base` class of `Backer`'s `Memory` adapter module. It has an instance method called `model_class` that allows you to hook up which model you wish to store in this repository; in the previous example we specified our `User` model.

Typically, it is recommended to keep repositories and models in their own respective folders inside of `lib/repositories` and `lib/models` of your project. In the case of our examples, the project tree would look like this:

```
lib
├── loader.rb
├── models
│   ├── user_model.rb
└── repositories
    └── user_memory_repository.rb
```

> ***Note:*** `loader.rb` in the root of the `lib` directory is just a home-made "autoloader" that pulls in both the specified models and repositories. An example of the contents of this is as such:
> ```ruby
> require_relative './models/user_model'
>require_relative './repositories/user_memory_repository'
> ```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dydx/backer-memory. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
