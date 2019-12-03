# frozen_string_literal: true

name 'codenamephp_mysql'
maintainer 'Bastian Schwarz'
maintainer_email 'bastian@codename-php.de'
license 'Apache-2.0'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.0.0'
chef_version '>= 13.0' if respond_to?(:chef_version)
issues_url 'https://github.com/codenamephp/chef.cookbook.mysql/issues'
source_url 'https://github.com/codenamephp/chef.cookbook.mysql'

supports 'debian', '~>10'

depends 'apt'
