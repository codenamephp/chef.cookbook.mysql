# frozen_string_literal: true

name 'codenamephp_mysql'
maintainer 'Bastian Schwarz'
maintainer_email 'bastian@codename-php.de'
license 'Apache-2.0'
description 'A cookbook to install mariadb on debian.'
version '2.0.1'
chef_version '>= 13.0'
issues_url 'https://github.com/codenamephp/chef.cookbook.mysql/issues'
source_url 'https://github.com/codenamephp/chef.cookbook.mysql'

supports 'debian', '~>10.0'

depends 'apt'
