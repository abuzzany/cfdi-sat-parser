[![Build Status](https://travis-ci.org/abuzzany/cfdi-sat-parser.svg?branch=master)](https://travis-ci.org/abuzzany/cfdi-sat-parser) [![Maintainability](https://api.codeclimate.com/v1/badges/1f7e1b1490feb131c8d6/maintainability)](https://codeclimate.com/github/abuzzany/cfdi-sat-parser/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/1f7e1b1490feb131c8d6/test_coverage)](https://codeclimate.com/github/abuzzany/cfdi-sat-parser/test_coverage)
# Cfdi::Sat::Parser

La idea principal de esta gema es parsear los CFDI (Comporbantes Fiscales Digitales) mejor
conocidos como Facturas del SAT que estan en formato XMl a un Hash.

## Instalación

Agrega esta linea al archivo Gemfile de tu aplicación:

```ruby
gem 'cfdi-sat-parser'
```

Y despues ejecuta:

    $ bundle

O instalala por tu cuenta:

    $ gem install cfdi-sat-parser

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cfdi-sat-parser.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
