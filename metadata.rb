name 'chef.cookbook.mysql'
maintainer 'Bastian Schwarz'
maintainer_email 'bastian@codename-php.de'
license 'Apache-2.0'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.1'
chef_version '>= 13.0' if respond_to?(:chef_version)
issues_url 'https://github.com/codenamephp/chef.cookbook.mysql/issues' if respond_to?(:issues_url)
source_url 'https://github.com/codenamephp/chef.cookbook.mysql' if respond_to?(:source_url)

supports 'debian', '~>9.3'
