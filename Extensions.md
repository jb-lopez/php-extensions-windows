# PHP Extensions for Windows

## Build Status
Below is are some tables showing the build status of the extensions that I've tried to build.

### Extensions that build successfully
These extensions successfully build with the default configuration.
Some of them need dependencies to be installed first, but those dependencies are available on the [PHP dependency](https://windows.php.net/downloads/php-sdk/deps/vs16/x64/) or [PECL dependency](https://windows.php.net/downloads/pecl/deps/) site.
| ✅ | Downloads | Extension | Info |
| --- | --- | --- | --- |
| 🟩 | 22336340 | [imagick](https://github.com/Imagick/imagick)                     | --with-imagick |
| 🟩 | 17693007 | [phpredis](https://github.com/phpredis/phpredis)                  | --enable-redis; needs git submodules |
| 🟩 | 15833735 | [xdebug](https://github.com/xdebug/xdebug)                        | --with-xdebug |
| 🟩 |  7859019 | [APCu](https://github.com/krakjoe/apcu)                           | --enable-apcu |
| 🟩 |  5809169 | [pcov](https://github.com/krakjoe/pcov)                           | --enable-pcov |
| 🟩 |  4806666 | [mongodb](https://github.com/mongodb/mongo-php-driver)            | --enable-mongodb; needs git submodules |
| 🟩 |  4400488 | [timezonedb](https://github.com/php/pecl-datetime-timezonedb)     | --enable-timezonedb |
| 🟩 |  3203562 | [igbinary](https://github.com/igbinary/igbinary)                  | --enable-igbinary |
| 🟩 |  2928558 | [memcached](https://github.com/php-memcached-dev/php-memcached)   | --enable-memcached |
| 🟩 |  2554552 | [amqp](https://github.com/php-amqp/php-amqp)                      | --with-amqp |
| 🟩 |  2186443 | [rdkafka](https://github.com/arnaud-lb/php-rdkafka)               | --with-rdkafka |
| 🟩 |  1409511 | [mcrypt](https://github.com/php/pecl-encryption-mcrypt)           | --with-mcrypt |
| 🟩 |  1368125 | [ssh2](https://github.com/php/pecl-networking-ssh2)               | --with-ssh2 |
| 🟩 |  1135121 | [yaml](https://github.com/php/pecl-file_formats-yaml)             | --with-yaml |
| 🟩 |   782249 | [zip](https://github.com/pierrejoye/php_zip)                      | --enable-zip |
| 🟩 |   469252 | [ast](https://github.com/nikic/php-ast)                           | --enable-ast |
| 🟩 |   285701 | [psr](https://github.com/jbboehr/php-psr)                         | --enable-psr |
| 🟩 |   232298 | [uopz](https://github.com/krakjoe/uopz)                           | --enable-uopz |
| 🟩 |   203726 | [ds](https://github.com/php-ds/ext-ds)                            | --enable-ds |
| 🟩 |    96894 | [trader](https://github.com/php/pecl-math-trader)                 | --enable-trader |
| 🟩 |    33035 | [crypto](https://github.com/bukka/php-crypto)                     | --with-crypto; needs git submodules |
| 🟩 |    42424 | [geospatial](https://github.com/php-geospatial/geospatial)        | --enable-geospatial |
| 🟩 |    12787 | [parallel](https://github.com/krakjoe/parallel)                   | --with-parallel |
| 🟩 |    12440 | [Tensor](https://github.com/RubixML/Tensor)                       | --enable-tensor |
| 🟩 |     4191 | [awscrt](https://github.com/awslabs/aws-crt-php)                  | --enable-awscrt |
| 🟩 |        0 | [svm](https://github.com/ianbarber/php-svm)                       | --with-svm |
| 🟩 |        0 | [stats](https://github.com/php/pecl-math-stats)                   | --enable-stats |
| 🟩 |        0 | [ncurses](https://github.com/jb-lopez/php_ncurses)                | --with-ncurses |

### Extensions that need work or deps to build
| ✅ | Downloads | Extension | Info |
| --- | --- | --- | --- |
| 🟨 |     2349 | [fann](https://github.com/bukka/php-fann)                         | needs git submodules; Checking for fann.h ...  <not found> |
| 🟨 |     2055 | [sdl](https://github.com/Ponup/php-sdl)                           | Checking for library SDL2.lib ... <not found> |
| 🟨 |        0 | [wxphp](https://github.com/wxphp/wxphp)                           | Checking for library wxmsw30u_richtext.lib ... <not found> |
| 🟨 |        0 | [v8js](https://github.com/phpv8/v8js)                             | error C2429: language feature 'terse static assert' requires compiler flag '/std:c++17' |
| 🟨 |        0 | [ui](https://github.com/krakjoe/ui)                               | Checking for ui.h ...  <not found> |
| 🟨 |        0 | [tools-svn](https://github.com/php/pecl-tools-svn)                | Checking for library libsvn_client-1.lib ... <not found> |
| 🟨 |        0 | [text-pdflib](https://github.com/php/pecl-text-pdflib)            | Checking for pdflib.h ...  <not found> |
| 🟨 |        0 | [pdflib](https://github.com/php/pecl-text-pdflib)                 | Checking for pdflib.h ...  <not found> |
| 🟨 |        0 | [lua](https://github.com/laruence/php-lua)                        | Checking for library liblua.lib;lua.lib;lua51.lib ... <not found> |

### Not compatible with PHP 8 on Windows without major changes
| ✅ | Downloads | Extension | Info |
| --- | --- | --- | --- |
| 🟥 |  1057318 | [gnupg](https://github.com/php-gnupg/php-gnupg)                   | No config.w32 file. Not ready for Windows. |
| 🟥 |   280841 | [decimal](https://github.com/php-decimal/ext-decimal)             | Syntax errors. Not ready for PHP8 or VS16? |
| 🟥 |   263514 | [xmlrpc](http://git.php.net/?p=pecl/networking/xmlrpc.git)        | Unmaintained. |
| 🟥 |    91154 | [couchbase](https://github.com/couchbase/php-couchbase)           | Linker errors. Not ready for PHP8 or VS16? |
| 🟥 |        0 | [sandbox](https://github.com/krakjoe/sandbox)                     | error C2065: 'zend_disable_function': undeclared identifier. |
| 🟥 |        0 | [operator](https://github.com/php/pecl-php-operator)              | Syntax errors. Not ready for PHP8 or VS16? |
| 🟥 |        0 | [cmark](https://github.com/krakjoe/cmark)                         | Syntax errors. Not ready for PHP8 or VS16? |

## Popular Downloads

This table is the downloads of versions of extensions that were released in the given year.
If a version was released in 2020 and downloaded in 2022 it counts as 2020.
The release of a PHP version and an extension version for that PHP version isn't guaranteed to be the same year.
But we can make inferences about which versions of PHP are popular for a given extension.
Since PHP 7.0 a new version has been released every year near the end of November or beginning of December.
PHP 7.0 was released in 2015, so we can assume that most of the downloads of extensions released in 2016 were for PHP 7.0.
Any extension not listed has not had a release since 2016.
The numbers for 2023 are up until 2023-06-03.

| Extension Release Year | PHP Version |
| --- | --- |
| 2016 | 7.0 |
| 2017 | 7.1 |
| 2018 | 7.2 |
| 2019 | 7.3 |
| 2020 | 7.4 |
| 2021 | 8.0 |
| 2022 | 8.1 |
| 2023 | 8.2 |

### Downloads by release year
---
| Package | Total | Total PHP8 Era ˅ | 2016 | 2017 | 2018 | 2019 | 2020 | 2021 | 2022 | 2023 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| imagick | 54871264 | 22336340 | 1049512 | 14682788 | - | 16802624 | - | 5540255 | 16796085 | - |
| redis | 29879580 | 17693007 | 913450 | 1267642 | 2261750 | 3621562 | 4122169 | 5929507 | 11763500 | - |
| xdebug | 35633568 | 15833735 | 1350454 | 2885214 | 3304982 | 5070263 | 7188920 | 6642036 | 8167591 | 1024108 |
| APCu | 18068165 | 7859019 | 2022945 | 771014 | 1771894 | 3942202 | 1701091 | 5148906 | 2710113 | - |
| pcov | 7672700 | 5809169 | - | - | - | 1863531 | - | 5809169 | - | - |
| mongodb | 13053599 | 4806666 | 1109899 | 1201629 | 2110366 | 1401549 | 2423490 | 2040662 | 2097081 | 668923 |
| timezonedb | 11020612 | 4400488 | 309737 | 609751 | 1268203 | 2559819 | 1872614 | 3132941 | 998727 | 268820 |
| igbinary | 5881082 | 3203562 | 134111 | 179254 | 409641 | 807277 | 1147237 | 985081 | 1749966 | 468515 |
| memcached | 9688795 | 2928558 | - | 1219712 | 1001520 | 4539005 | - | - | 2928558 | - |
| amqp | 5655462 | 2554552 | 327836 | 817625 | - | 758254 | 1197195 | 2554552 | - | - |
| sqlsrv | 3980459 | 2309356 | 40390 | 175586 | 259552 | 436274 | 759301 | 1005910 | 1083620 | 219826 |
| rdkafka | 3395824 | 2186443 | 39375 | 297701 | - | 495561 | 376744 | 703508 | 1482935 | - |
| pdo_sqlsrv | 3707789 | 2175519 | 40813 | 158105 | 233631 | 390348 | 709373 | 958820 | 1010652 | 206047 |
| mcrypt | 9425109 | 1409511 | 2469319 | - | - | 3887602 | 1658677 | - | 1197995 | 211516 |
| ssh2 | 5141636 | 1368125 | 1661853 | 1440210 | - | 671448 | - | 1289311 | - | 78814 |
| yaml | 10176108 | 1135121 | 6823386 | 419973 | 711628 | - | 1086000 | 992376 | - | 142745 |
| gnupg | 3216342 | 1070786 | 2145556 | - | - | - | - | 1070786 | - | - |
| mailparse | 2082791 | 939889 | 597525 | - | - | 201619 | 343758 | 205386 | 734503 | - |
| gRPC | 2045235 | 929721 | 93584 | 246390 | 173391 | 225923 | 376226 | 389190 | 449622 | 90909 |
| swoole | 5822926 | 908108 | 227287 | 161059 | 277877 | 3445876 | 802719 | 505545 | 341334 | 61229 |
| zip | 2404207 | 782249 | 215520 | 214045 | 411685 | 191267 | 589441 | 330163 | 452086 | - |
| protobuf | 973047 | 558502 | 6143 | 14635 | 63171 | 101959 | 228637 | 211005 | 290078 | 57419 |
| ast | 1935096 | 469252 | - | 93633 | 140788 | 746753 | 484670 | 323784 | 145468 | - |
| smbclient | 651918 | 447592 | 13100 | 45783 | 133834 | - | 11609 | 383605 | - | 63987 |
| lzf | 651589 | 344123 | 55789 | 72550 | 81325 | - | 97802 | - | 344123 | - |
| psr | 459739 | 285701 | - | 1969 | 42024 | 38575 | 91470 | 285701 | - | - |
| decimal | 392701 | 283932 | - | - | 2561 | 33019 | 73189 | 283932 | - | - |
| xmlrpc | 266175 | 266175 | - | - | - | - | - | 266175 | - | - |
| pecl_http | 669750 | 258204 | 184063 | 2492 | 55935 | 168162 | 894 | 140646 | 117558 | - |
| event | 1294434 | 233040 | 61001 | - | 102753 | 823344 | 74296 | 132045 | 100995 | - |
| uopz | 455407 | 232298 | 33048 | 30265 | - | 74025 | 85771 | 232298 | - | - |
| opencensus | 333571 | 225145 | - | 3359 | 105067 | - | - | 225145 | - | - |
| xhprof | 277034 | 206344 | - | - | - | 15271 | 55419 | 115625 | 90719 | - |
| ds | 619672 | 203726 | 49048 | 17858 | 23082 | 192924 | 133034 | 203726 | - | - |
| xlswriter | 220379 | 166957 | - | - | - | 14812 | 38610 | 64093 | 69152 | 33712 |
| ev | 1013840 | 154877 | 82533 | - | - | 773906 | 2524 | 154877 | - | - |
| oci8 | 2141215 | 150076 | 406102 | 323084 | 1083606 | - | 178347 | 129428 | - | 20648 |
| datadog_trace | 170434 | 149460 | - | - | - | 9338 | 11636 | 55330 | 69097 | 25033 |
| openswoole | 134002 | 134002 | - | - | - | - | - | 17864 | 116138 | - |
| uploadprogress | 351284 | 123679 | - | - | - | - | 227605 | 123679 | - | - |
| phalcon | 166595 | 121758 | - | - | - | 4 | 44833 | 84933 | 24856 | 11969 |
| zstd | 117123 | 102569 | - | - | - | 2323 | 12231 | 63154 | 13464 | 25951 |
| maxminddb | 100334 | 98335 | - | - | - | - | 1999 | 98335 | - | - |
| trader | 196989 | 96894 | - | - | 100095 | - | - | 96894 | - | - |
| vips | 282560 | 93105 | 4454 | 32015 | 9323 | 44512 | 99151 | - | 93105 | - |
| memcache | 2828958 | 92203 | - | - | - | 1041599 | 1695156 | - | - | 92203 |
| couchbase | 550467 | 91827 | 209489 | 68617 | 54213 | 27772 | 98549 | 74504 | 13145 | 4178 |
| runkit7 | 145729 | 90085 | - | - | - | 39674 | 15970 | 68286 | 21799 | - |
| gearman | 82242 | 82242 | - | - | - | - | - | 82242 | - | - |
| ibm_db2 | 184576 | 72596 | 28052 | 9584 | 19267 | 47989 | 7088 | 48675 | 23921 | - |
| solr | 653522 | 69646 | 170872 | - | - | 55043 | 357961 | - | 69646 | - |
| apfd | 99649 | 67156 | - | - | - | - | 32493 | 67156 | - | - |
| scoutapm | 78661 | 64797 | - | - | - | 7891 | 5973 | 22984 | 41813 | - |
| gmagick | 246509 | 62152 | 82939 | - | 101418 | - | - | 62152 | - | - |
| dbase | 214976 | 60828 | 96325 | - | - | 55012 | 2811 | 60828 | - | - |
| yaf | 179842 | 60356 | 31072 | 22799 | 30011 | 11572 | 24032 | 40558 | 19798 | - |
| msgpack | 1228847 | 56382 | 140007 | - | 198881 | 9529 | 824048 | 35487 | 19240 | 1655 |
| zephir_parser | 53450 | 53450 | - | - | - | - | - | 17803 | 32155 | 3492 |
| SeasLog | 136451 | 50971 | 33051 | 11651 | 13637 | 12712 | 14429 | 50971 | - | - |
| yar | 93695 | 50355 | 2390 | 12649 | 11727 | 1160 | 15414 | 29611 | 20744 | - |
| excimer | 39502 | 39502 | - | - | - | - | - | 17192 | 8876 | 13434 |
| xdiff | 116221 | 36745 | 79476 | - | - | - | - | 20243 | 16502 | - |
| memprof | 57662 | 35242 | - | 15748 | - | - | 6672 | 6314 | 28928 | - |
| sync | 67195 | 35030 | 2102 | 30063 | - | - | - | 35030 | - | - |
| rrd | 81013 | 33633 | 47380 | - | - | - | - | 33633 | - | - |
| crypto | 82491 | 33035 | 49456 | - | - | - | - | 33035 | - | - |
| vld | 59114 | 28906 | 10305 | - | 2068 | 8126 | 9709 | 20944 | 7962 | - |
| geospatial | 42424 | 26378 | - | 2318 | - | 13728 | - | 16976 | 9402 | - |
| stomp | 587349 | 24861 | 224859 | 110755 | 226874 | - | - | - | 24861 | - |
| xmldiff | 23085 | 23085 | - | - | - | - | - | 23085 | - | - |
| eio | 150428 | 21594 | 17423 | 12719 | 98692 | - | - | 21232 | - | 362 |
| json_post | 34841 | 21568 | - | - | - | - | 13273 | 21568 | - | - |
| simple_kafka_client | 18952 | 18952 | - | - | - | - | - | 18952 | - | - |
| dio | 143468 | 18604 | 8578 | 44716 | - | - | 71570 | - | 18604 | - |
| yac | 48453 | 18429 | 6969 | 12905 | - | - | 10150 | 18429 | - | - |
| parle | 36483 | 17373 | - | 2021 | 17089 | - | - | 6863 | 8848 | 1662 |
| LuaSandbox | 23886 | 16572 | - | - | 7314 | - | - | 8474 | 8098 | - |
| zookeeper | 157206 | 13993 | 7247 | 9029 | 19620 | 107317 | - | 10192 | - | 3801 |
| CSV | 30149 | 13338 | - | - | - | - | 16811 | 5606 | 7732 | - |
| scrypt | 91406 | 12911 | 78495 | - | - | - | - | - | 11628 | 1283 |
| parallel | 97578 | 12787 | - | - | - | 23642 | 61149 | - | 12787 | - |
| Tensor | 12440 | 12440 | - | - | - | - | - | 9415 | 2243 | 782 |
| PAM | 12393 | 12393 | - | - | - | - | - | 5744 | 6649 | - |
| opentelemetry | 8734 | 8734 | - | - | - | - | - | - | - | 8734 |
| varnish | 27844 | 7517 | 7963 | - | 12364 | - | - | 7517 | - | - |
| mysql_xdevapi | 26175 | 6897 | 705 | 1952 | 3913 | 6239 | 6469 | 4005 | 2892 | - |
| mustache | 28452 | 6603 | - | 3771 | 9868 | 5347 | 2863 | - | 6603 | - |
| simdjson | 6387 | 6387 | - | - | - | - | - | - | 6387 | - |
| yaz | 99208 | 6029 | 44376 | 8000 | 40803 | - | - | - | 6029 | - |
| jsonpath | 5966 | 5966 | - | - | - | - | - | 1168 | 4798 | - |
| skywalking_agent | 5879 | 5879 | - | - | - | - | - | - | 3880 | 1999 |
| PDO_INFORMIX | 27619 | 5696 | 6992 | 14931 | - | - | - | 2756 | 2940 | - |
| yaconf | 41683 | 5548 | 7151 | 15917 | - | 3879 | 9188 | 2216 | 3332 | - |
| skywalking | 14772 | 5298 | - | - | - | 2070 | 7404 | 3561 | 1737 | - |
| ion | 4231 | 4231 | - | - | - | - | - | - | 4231 | - |
| awscrt | 4191 | 4191 | - | - | - | - | - | 3299 | 455 | 437 |
| php_trie | 5069 | 4067 | - | - | - | - | 1002 | - | 4067 | - |
| krb5 | 164962 | 3259 | 7105 | 46145 | - | - | 108453 | - | - | 3259 |
| PKCS11 | 5467 | 3193 | - | - | - | - | 2274 | 1997 | 1196 | - |
| teds | 2923 | 2923 | - | - | - | - | - | 725 | 2198 | - |
| ice | 4921 | 2653 | - | - | - | - | 2268 | 2032 | 427 | 194 |
| PDO_IBM | 22658 | 2548 | 7027 | 3762 | - | 7430 | 1891 | 699 | 1849 | - |
| ps | 21146 | 2416 | 6876 | 11854 | - | - | - | 2416 | - | - |
| fann | 44016 | 2354 | 41662 | - | - | - | - | 925 | 1429 | - |
| pq | 43501 | 2350 | 22622 | 1478 | 4047 | 8467 | 4537 | 1965 | - | 385 |
| pcsc | 2188 | 2188 | - | - | - | - | - | 2188 | - | - |
| nsq | 23537 | 2089 | - | - | 5145 | 16303 | - | 2089 | - | - |
| sdl | 8855 | 2077 | - | - | 852 | 4854 | 1072 | 754 | 1323 | - |
| leveldb | 8001 | 1826 | - | - | 6175 | - | - | 1826 | - | - |
| Bitset | 53329 | 1479 | 15825 | 36025 | - | - | - | - | - | 1479 |
| var_representation | 1406 | 1406 | - | - | - | - | - | 1153 | 253 | - |
| sdl_mixer | 1130 | 1130 | - | - | - | - | - | - | 1130 | - |
| win32service | 11329 | 1015 | - | 2031 | 1576 | 5268 | 1439 | 787 | 228 | - |
| rpminfo | 11173 | 925 | - | - | 4463 | - | 5785 | 925 | - | - |
| selinux | 6378 | 818 | - | - | 4109 | - | 1451 | 818 | - | - |
| SeasSnowflake | 682 | 682 | - | - | - | - | - | 682 | - | - |
| weakreference_bc | 521 | 521 | - | - | - | - | - | - | 521 | - |
| bsdiff | 479 | 479 | - | - | - | - | - | - | 479 | - |
| PDO_TAOS | 462 | 462 | - | - | - | - | - | - | 462 | - |
| ip2location | 7794 | 369 | - | 5379 | - | - | 2046 | - | 369 | - |
| quickhash | 304 | 304 | - | - | - | - | - | - | 304 | - |
| sdl_image | 290 | 290 | - | - | - | - | - | - | 290 | - |
| pledge | 7156 | 225 | - | - | 6931 | - | - | - | 225 | - |
| ip2proxy | 1650 | 220 | - | - | - | - | 1430 | - | 220 | - |
| sdl_ttf | 184 | 184 | - | - | - | - | - | - | 184 | - |
| rnp | 175 | 175 | - | - | - | - | - | - | 122 | 53 |
| handlebars | 9432 | 137 | - | 1443 | 5058 | - | 2794 | - | 137 | - |
| immutable_cache | 91 | 91 | - | - | - | - | - | - | 91 | - |
| SeasClick | 21802 | 80 | - | - | - | 21722 | - | - | - | 80 |
| oauth | 1114588 | 0 | 244299 | - | 137945 | 182551 | 549793 | - | - | - |
| libsodium | 1719315 | 0 | 190497 | 86758 | 93689 | 364856 | 983515 | - | - | - |
| hprose | 80693 | 0 | 12781 | 6184 | - | 5849 | 55879 | - | - | - |
| uuid | 535008 | 0 | - | - | - | 97002 | 438006 | - | - | - |
| rar | 185168 | 0 | - | 116546 | - | - | 68622 | - | - | - |
| v8js | 292224 | 0 | 76124 | 29711 | 70835 | 56742 | 58812 | - | - | - |
| inotify | 300164 | 0 | 128209 | - | - | - | 171955 | - | - | - |
| pcs | 149443 | 0 | - | 144033 | - | - | 5410 | - | - | - |
| lua | 87680 | 0 | 13383 | 16534 | 19295 | - | 38468 | - | - | - |
| taint | 98137 | 0 | 5368 | 2884 | 8175 | 6381 | 75329 | - | - | - |
| expect | 17559 | 0 | - | - | - | - | 17559 | - | - | - |
| xattr | 42377 | 0 | 22086 | - | - | - | 20291 | - | - | - |
| mysqlnd_azure | 72834 | 0 | - | - | - | 2738 | 70096 | - | - | - |
| translit | 14024 | 0 | - | - | - | 3607 | 10417 | - | - | - |
| componere | 29991 | 0 | - | - | 929 | 12343 | 16719 | - | - | - |
| request | 9741 | 0 | 3257 | 4805 | - | - | 1679 | - | - | - |
| base58 | 7529 | 0 | - | - | - | 5125 | 2404 | - | - | - |
| http_message | 6940 | 0 | - | - | - | 5445 | 1495 | - | - | - |
| apcu_bc | 1734033 | 0 | 602884 | - | 220418 | 910731 | - | - | - | - |
| pdflib | 102315 | 0 | 29586 | 32476 | - | 40253 | - | - | - | - |
| raphf | 726871 | 0 | 247394 | - | - | 479477 | - | - | - | - |
| svn | 247178 | 0 | 240927 | - | - | 6251 | - | - | - | - |
| uv | 47554 | 0 | 7476 | 6773 | - | 33305 | - | - | - | - |
| cmark | 38685 | 0 | - | - | 19836 | 18849 | - | - | - | - |
| ahocorasick | 28923 | 0 | - | - | 831 | 28092 | - | - | - | - |
| openal | 5141 | 0 | - | - | - | 5141 | - | - | - | - |
| sandbox | 5415 | 0 | - | - | - | 5415 | - | - | - | - |
| wasm | 4962 | 0 | - | - | - | 4962 | - | - | - | - |
| propro | 548119 | 0 | 168890 | - | 379229 | - | - | - | - | - |
| jsmin | 116713 | 0 | - | - | 116713 | - | - | - | - | - |
| ssdeep | 94491 | 0 | - | - | 94491 | - | - | - | - | - |
| svm | 77558 | 0 | - | - | 77558 | - | - | - | - | - |
| stackdriver_debugger | 42828 | 0 | - | 1358 | 41470 | - | - | - | - | - |
| jsonnet | 16796 | 0 | 10105 | 721 | 5970 | - | - | - | - | - |
| Druid | 23366 | 0 | 7372 | 11130 | 4864 | - | - | - | - | - |
| v8 | 13563 | 0 | - | 5438 | 8125 | - | - | - | - | - |
| opengl | 5097 | 0 | - | - | 5097 | - | - | - | - | - |
| ref | 7836 | 0 | - | 3622 | 4214 | - | - | - | - | - |
| mongo | 2606462 | 0 | 1672518 | 933944 | - | - | - | - | - | - |
| Mosquitto | 1511318 | 0 | - | 1511318 | - | - | - | - | - | - |
| cassandra | 373882 | 0 | 155997 | 217885 | - | - | - | - | - | - |
| timecop | 321950 | 0 | - | 321950 | - | - | - | - | - | - |
| APM | 29980 | 0 | 8473 | 21507 | - | - | - | - | - | - |
| hrtime | 42465 | 0 | - | 42465 | - | - | - | - | - | - |
| tcpwrap | 9158 | 0 | - | 9158 | - | - | - | - | - | - |
| PDO_CUBRID | 5198 | 0 | - | 5198 | - | - | - | - | - | - |
| PDO_SQLANYWHERE | 30376 | 0 | 4674 | 25702 | - | - | - | - | - | - |
| CUBRID | 7592 | 0 | - | 7592 | - | - | - | - | - | - |
| mqseries | 10309 | 0 | - | 10309 | - | - | - | - | - | - |
| jsond | 20013 | 0 | 979 | 19034 | - | - | - | - | - | - |
| trace | 8099 | 0 | - | 8099 | - | - | - | - | - | - |
| Molten | 14552 | 0 | - | 14552 | - | - | - | - | - | - |
| swoole_serialize | 5447 | 0 | - | 5447 | - | - | - | - | - | - |
| geoip | 917151 | 0 | 917151 | - | - | - | - | - | - | - |
| mogilefs | 13278 | 0 | 13278 | - | - | - | - | - | - | - |
| stats | 449531 | 0 | 449531 | - | - | - | - | - | - | - |
| pthreads | 206273 | 0 | 206273 | - | - | - | - | - | - | - |
| zmq | 314294 | 0 | 314294 | - | - | - | - | - | - | - |
| radius | 49483 | 0 | 49483 | - | - | - | - | - | - | - |
| jsonc | 39340 | 0 | 39340 | - | - | - | - | - | - | - |
| Weakref | 65740 | 0 | 65740 | - | - | - | - | - | - | - |
| WinCache | 60612 | 0 | 60612 | - | - | - | - | - | - | - |
| ui | 57308 | 0 | 57308 | - | - | - | - | - | - | - |
| xxtea | 32059 | 0 | 32059 | - | - | - | - | - | - | - |
| env | 20766 | 0 | 20766 | - | - | - | - | - | - | - |
| hdr_histogram | 12951 | 0 | 12951 | - | - | - | - | - | - | - |
| termbox | 10211 | 0 | 10211 | - | - | - | - | - | - | - |
