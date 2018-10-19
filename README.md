[![Build Status](https://travis-ci.org/abuzzany/cfdi-sat-parser.svg?branch=master)](https://travis-ci.org/abuzzany/cfdi-sat-parser) [![Maintainability](https://api.codeclimate.com/v1/badges/1f7e1b1490feb131c8d6/maintainability)](https://codeclimate.com/github/abuzzany/cfdi-sat-parser/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/1f7e1b1490feb131c8d6/test_coverage)](https://codeclimate.com/github/abuzzany/cfdi-sat-parser/test_coverage)
# Cfdi::Sat::Parser

La gente que trabaje con sistemas contables en México seguro conoce el 
dolor de cabeza 💆🏻‍♂️ que es lidear con cosas que vengan del SAT 🤬, por ejemplo los CFDIs (Comporbantes Fiscales Digitales) mejor conocidos como Facturas que estan en formato XMl.

La idea principal de esta gema es hacer un poco más digerible las facturas parseado los XMLs a un Hash.

Actualmente la gema parsea todos los nodos y atributos de las siguientes versiones
de CFDIs y complementos:
- CFDI versión 3.3 
- Complemento de pago 1.2 en CFDIs versión 3.3 (WIP)

## Instalación

Agrega esta linea al archivo Gemfile de tu aplicación:

```ruby
gem 'cfdi-sat-parser'
```

Y despues ejecuta:

    $ bundle

O instalala por tu cuenta:

    $ gem install cfdi-sat-parser

## Uso

```ruby
    # String que contiene el xml del CFDI versión 3.3
    sat_xml = '<cfdi:Comprobante Total="100.00" Version="3.3"...'
    xml_parseado =  CfdiSat::V33::Parser.run(xml)
```

## Desarrollo

Después de hacer check out del proyecto, ejecuta `bin/setup` para instalar las dependencias. Después ejecuta `rake spec` para correr las purebas. También puedes ejecutar `bin/console` para interactuar con la gema desde una sesión de consola.

Para instalar la gema en tu local, ejecuta `bundle exec rake install`.

## Contributing

Reportes de bugs y pull requests son bienvenidos en GitHub https://github.com/abuzzany/cfdi-sat-parser.

## License

Esta gema esta disponible como software de código abierto bajo los terminos de [MIT License](https://opensource.org/licenses/MIT).
