# Chef Cookbook MySQL
[![Build Status](https://travis-ci.org/codenamephp/chef.cookbook.mysql.svg?branch=dev)](https://travis-ci.org/codenamephp/chef.cookbook.mysql)

The default cookbook installs mysql/mariadb. The install method right now is only "package", although docker is planned for the future.

## Why not mysql cookbook from chef?

At the time this cookbook was created, the [mysql cookbook by chef][chef-mysql] did not support debian stretch. Also, the cookbook provides a whole lot of features ... none of which I plan to use.
That's why I decided to create my own cookbook that just caters to my needs.

## Requirements

### Supported Platforms

- Debian Stretch

### Chef

- Chef 13.1+

### Cookbook Depdendencies

None

## Usage

Add the cookbook to your Berksfile:

```ruby
cookbook 'codenamephp_mysql'
```

Add the cookbook to your runlist, e.g. in a role:

```json
{
  "name": "default",
  "chef_type": "role",
  "json_class": "Chef::Role",
  "run_list": [
	  "recipe[codenamephp_mysql]"
  ]
}
```

## Cookbooks

### Default
The default cookbook just installs the mysql-server and mysql-client package from whatever source is configured in the os. It also makes sure the mysql service is enabled
and started and installs a configuration template that makes sure each innodb table is it's own file since all tables in a single file tends to cause huge db files as the
disk space is never freed if a table is deleted.

### 5.6
The 5.6 cookbook adds the official oracle apt repository for version 5.6 before installing the mysql-server and mysql client package. It also makes sure the mysql service is enabled
and started and installs a configuration template that makes sure each innodb table is it's own file since all tables in a single file tends to cause huge db files as the
disk space is never freed if a table is deleted.

[chef-mysql]: https://supermarket.chef.io/cookbooks/mysql