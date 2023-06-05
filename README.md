# Build Windows PHP Extensions

~This is a fork of [shivammathur/php-extensions-windows](https://github.com/shivammathur/php-extensions-windows).
I forked this to add more extensions to the build workflow.~

The upstream [shivammathur/php-builder-windows](https://github.com/shivammathur/php-builder-windows "PHP Snapshots") has changed, causing many builds to fail.
I've removed the references, and this project is no longer a fork of [shivammathur/php-extensions-windows](https://github.com/shivammathur/php-extensions-windows) but still inspired by it.

## Build Status
| Status | Upstream Repo |
| --- | ----- |
| [![APCU](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/apcu.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/apcu) | [krakjoe/apcu](https://github.com/krakjoe/apcu) |
| [![AST](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/ast.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/ast) | [nikic/php-ast](https://github.com/nikic/php-ast) |
| [![AWS-CRT](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/awscrt.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/awscrt) | [awslabs/aws-crt-php](https://github.com/awslabs/aws-crt-php) |
| [![DS](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/ds.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/ds) | [php-ds/ext-ds](https://github.com/php-ds/ext-ds) |
| [![Geospatial](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/geospatial.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/geospatial) | [php-geospatial/geospatial](https://github.com/php-geospatial/geospatial) |
| [![Ncurses](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/ncurses.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/ncurses) | [jb-lopez/php_ncurses](https://github.com/jb-lopez/php_ncurses) |
| [![Parallel](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/parallel.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/parallel) | [krakjoe/parallel](https://github.com/krakjoe/parallel) |
| [![Pcov](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/pcov.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/pcov) | [krakjoe/pcov](https://github.com/krakjoe/pcov) |
| [![PSR](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/psr.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/psr) | [jbboehr/php-psr](https://github.com/jbboehr/php-psr) |
| [![Stats](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/stats.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/stats) | [php/pecl-math-stats](https://github.com/php/pecl-math-stats) |
| [![SVM](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/svm.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/svm) | [ianbarber/php-svm](https://github.com/ianbarber/php-svm) |
| [![Tensor](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/tensor.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/tensor) | [RubixML/Tensor](https://github.com/RubixML/Tensor) |
| [![Trader](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/trader.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/trader) | [php/pecl-math-trader](https://github.com/php/pecl-math-trader) |
| [![UOPZ](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/uopz.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/uopz) | [krakjoe/uopz](https://github.com/krakjoe/uopz) |
| [![Xdebug](https://github.com/jb-lopez/php-extensions-windows/actions/workflows/xdebug.yml/badge.svg)](https://github.com/jb-lopez/php-extensions-windows/releases/tag/xdebug) | [xdebug/xdebug](https://github.com/xdebug/xdebug) |

## License
The code in this project is licensed under the [MIT license](http://choosealicense.com/licenses/mit/).
Please see the [license file](LICENSE) for more information.

### License of the built extensions
The built extensions are licensed under their own license. Please refer to the respective extension's repository for more information.
