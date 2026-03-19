# 🐘 php - the uncanny Personal Home Page programming language.

## PHP

Select the version of PHP to install by setting the `SSDF_PHP_VERSION` envvar
(defaults to `8.3`), e.g.:

```console
# Change the value in ~/.config/php/envvars.php.sh
# Or set it on the fly as follow:
SSDF_PHP_VERSION=8.5 bash install.sh 
```

Sets some default PHP configuration settings, for the local (development),
see `./config/42-user.ini`.

## Extensions

Additionally installs:

* [Composer](https://getcomposer.org/), the PHP package manager
* [Pie](https://github.com/php/pie), the PHP extension manager
  (**requires PHP >=8.1**)

Pie will use the `./config/composer.json` file to install the following extensions:

* Arbitrary Precision Mathematics: `bcmath`
* PIE (working with archives): `zip`
* PostgreSQL: `pdo_pgsql`
* Symfony (config, HTTP client, translation): `curl`, `iconv`, `intl`, `mbstring`, `simplexml`
