# Chef Cookbook MySQL
[![Build Status](https://travis-ci.org/codenamephp/chef.cookbook.mysql.svg?branch=master)](https://travis-ci.org/codenamephp/chef.cookbook.mysql)

The default cookbook installs mariadb. Yes, only mariadb is installed even though the cookbook is named "mysql" for historic reasons.

## Deprecated
The whole cookbook is now deprecated. I don't want to fiddle around with installs anymore when there's excellent docker images around.

## Why not mysql cookbook from chef?

At the time this cookbook was created, the [mysql cookbook by chef][chef-mysql] did not support debian stretch. Also, the cookbook provides a whole lot of features ... none of which I plan to use.
That's why I decided to create my own cookbook that just caters to my needs.

## Requirements

### Supported Platforms

- Debian Buster

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
The default cookbook just installs the mariadb-server and mariadb-client package from whatever source is configured in the os. It also makes sure the mariadb service is enabled
and started and installs a configuration template that makes sure each innodb table is it's own file since all tables in a single file tends to cause huge db files as the
disk space is never freed if a table is deleted.
Also the bind_address is reset so we can connect using docker.

[chef-mysql]: https://supermarket.chef.io/cookbooks/mysql