# 🐘 php - Tarakava specific extensions

Installs PHP extensions only needed on Tarakava, on top of the ones installed
on every machine by `202-php` (which also provides PHP, Composer and Pie).

Pie will use the `./config/composer.json` file to install the following extensions:

* Kafka client: `rdkafka`

Extensions requiring configure options are installed explicitly beforehand,
as `./config/composer.json` can't provide them:

* `rdkafka`: needs the path to `librdkafka` (installed by the package manager)
