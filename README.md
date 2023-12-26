# Build Windows PHP Extensions

~This is a fork of [shivammathur/php-extensions-windows](https://github.com/shivammathur/php-extensions-windows).
I forked this to add more extensions to the build workflow.~

The upstream [shivammathur/php-builder-windows](https://github.com/shivammathur/php-builder-windows "PHP Snapshots") has changed, causing many builds to fail.
I've removed the references, and this project is no longer a fork of [shivammathur/php-extensions-windows](https://github.com/shivammathur/php-extensions-windows) but still inspired by it.

## Build Status

Click on the build badge in the table below to go to the release page for the extension.

| Status                                                                                                                                                                                     | Upstream Repo                                                                         |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| [![AMQP](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/amqp.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/amqp)                   | [php-amqp/php-amqp](https://github.com/php-amqp/php-amqp)                             |
| [![APCU](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/apcu.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/apcu)                   | [krakjoe/apcu](https://github.com/krakjoe/apcu)                                       |
| [![AST](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/ast.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/ast)                      | [nikic/php-ast](https://github.com/nikic/php-ast)                                     |
| [![AWS-CRT](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/awscrt.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/awscrt)            | [awslabs/aws-crt-php](https://github.com/awslabs/aws-crt-php)                         |
| [![Crypto](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/crypto.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/crypto)             | [bukka/php-crypto](https://github.com/bukka/php-crypto)                               |
| [![DS](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/ds.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/ds)                         | [php-ds/ext-ds](https://github.com/php-ds/ext-ds)                                     |
| [![Geospatial](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/geospatial.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/geospatial) | [php-geospatial/geospatial](https://github.com/php-geospatial/geospatial)             |
| [![IGBinary](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/igbinary.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/igbinary)       | [igbinary/igbinary](https://github.com/igbinary/igbinary)                             |
| [![Imagick](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/imagick.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/imagick)          | [Imagick/imagick](https://github.com/Imagick/imagick)                                 |
| [![Kafka](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/rdkafka.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/rdkafka)            | [arnaud-lb/php-rdkafka](https://github.com/arnaud-lb/php-rdkafka)                     |
| [![mcrypt](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/mcrypt.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/mcrypt)             | [php/pecl-encryption-mcrypt](https://github.com/php/pecl-encryption-mcrypt)           |
| [![Memcached](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/memcached.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/memcached)    | [php-memcached-dev/php-memcached](https://github.com/php-memcached-dev/php-memcached) |
| [![MongoDB](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/mongodb.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/mongodb)          | [mongodb/mongo-php-driver](https://github.com/mongodb/mongo-php-driver)               |
| [![Ncurses](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/ncurses.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/ncurses)          | [jb-lopez/php_ncurses](https://github.com/jb-lopez/php_ncurses)                       |
| [![Parallel](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/parallel.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/parallel)       | [krakjoe/parallel](https://github.com/krakjoe/parallel)                               |
| [![Pcov](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/pcov.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/pcov)                   | [krakjoe/pcov](https://github.com/krakjoe/pcov)                                       |
| [![PSR](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/psr.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/psr)                      | [jbboehr/php-psr](https://github.com/jbboehr/php-psr)                                 |
| [![Redis](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/phpredis.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/redis)             | [phpredis/phpredis](https://github.com/phpredis/phpredis)                             |
| [![SSH2](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/ssh2.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/ssh2)                   | [php/pecl-networking-ssh2](https://github.com/php/pecl-networking-ssh2)               |
| [![Stats](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/stats.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/stats)                | [php/pecl-math-stats](https://github.com/php/pecl-math-stats)                         |
| [![SVM](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/svm.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/svm)                      | [ianbarber/php-svm](https://github.com/ianbarber/php-svm)                             |
| [![Tensor](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/tensor.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/tensor)             | [RubixML/Tensor](https://github.com/RubixML/Tensor)                                   |
| [![TimezoneDB](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/timezonedb.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/timezonedb) | [php/pecl-datetime-timezonedb](https://github.com/php/pecl-datetime-timezonedb)       |
| [![Trader](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/trader.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/trader)             | [php/pecl-math-trader](https://github.com/php/pecl-math-trader)                       |
| [![UOPZ](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/uopz.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/uopz)                   | [krakjoe/uopz](https://github.com/krakjoe/uopz)                                       |
| [![Xdebug](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/xdebug.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/xdebug)             | [xdebug/xdebug](https://github.com/xdebug/xdebug)                                     |
| [![YAML](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/yaml.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/yaml)                   | [php/pecl-file_formats-yaml](https://github.com/php/pecl-file_formats-yaml)           |
| [![ZIP](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/zip.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/zip)                      | [pierrejoye/php_zip](https://github.com/pierrejoye/php_zip)                           |

## License
The code in this project is licensed under the [MIT license](http://choosealicense.com/licenses/mit/).
Please see the [license file](LICENSE) for more information.

### License of the built extensions
The built extensions are licensed under their own license. Please refer to the respective extension's repository for more information.
