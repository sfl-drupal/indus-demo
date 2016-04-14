= Indus Demo Drupal Boilerplate
SFL Drupal Team <drupal@lists.savoirfairelinux.net>

This *generic template* aims at _implementating_ a default project tree, that then could be used as a *starter kit* for new Drupal projects.

TIP: More information on our Drupal practices at Savoir-faire Linux are described in {sfl-wiki-drupal}[the official Wiki].

== System Requirements

This installation profile has been designed to work with Drupal 7, and is compatible with PHP > 5.3.
Ensure your system is properly installed.

TIP: Whenever it is possible, you should use *Composer* to install and manage the PHP dependencies.

The following dependencies need to be installed:

* {doc-docker}[Docker]
* {doc-fabric}[Fabric]
* {doc-drush}[Drush] (version 6 or 7)

== Installation

CAUTION: The installation procedure to set-up Docker is not described here. Please refer to the official documentation on how to install {doc-docker-installation}[Docker Engine]. The Docker image is based on our {doc-docker-baseimage}[Docker base image], that will automatically installed at setup.

First, you should clone this repository.

 $ git clone --recursive https://github.com/sfl-drupal/indus-demo.git

It is recommanded to clone with the _recursive_ option to automatically fetch the included _git submodules_ (namely, Drupalizer, our tasks-automation tool).

TIP: If you properly init the submodule, you should have a _fabfile_ directory at the repository root.

Then, copy and, optionally, edit your local configuration file:

 $ cp ../conf/drupalizer.py fabfile/local_vars.py

You are now ready to build the SFLinux distribution:

 $ fab init

The Docker image containing the Drupal installation should now be up and running, and the site should now be accessible at http://local.boilerplate.sfl.

include::fabfile/README.adoc[]

== Official documentation

More on Drupal distributions: https://www.drupal.org/documentation/build/distributions.

More on Drush and Makefile: https://www.drupal.org/node/1432374.

== About this document

This document uses the Asciidoc syntax generator.
It is a convenient tool allowing to write documentation in raw text files, and convert them to HTML or PDF later on.

Visit https://github.com/asciidoctor[Asciidoctor @ *GitHub*] for more informations.
The {doc-asciidoctor}[AsciiDoc Recommanded Practices] is also recommanded.

To generate a HTML version, first install asciidoctor package on your Linux distribution, then issue following command:

 $ asciidoctor README.adoc

The README.html is generated in the current directory.

Asciidoctor provides a native PDF renderer for Asciidoc. Still in alpha, but worth the try. Please follow the instructions on the official documentation to
install it, then issue following command:

 $ asciidoctor-pdf README.adoc

The README.pdf file shall be created in the current directory.

