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
[chef-mysql]: https://supermarket.chef.io/cookbooks/mysql