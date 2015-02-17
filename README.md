## Sensu-Plugins-gluster

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-gluster.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-gluster)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-gluster.svg)](http://badge.fury.io/rb/sensu-plugins-gluster)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-gluster/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-gluster)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-gluster/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-gluster)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-gluster.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-gluster)

## Functionality

## Files
 * bin/check-gluster-georepl-status

## Usage

## Installation

Add the public key (if you haven’t already) as a trusted certificate

```
gem cert --add <(curl -Ls https://raw.githubusercontent.com/sensu-plugins/sensu-plugins.github.io/master/certs/sensu-plugins.pem)
gem install sensu-plugins-gluster -P MediumSecurity
```

You can also download the key from /certs/ within each repository.

#### Rubygems

`gem install sensu-plugins-gluster`

#### Bundler

Add *sensu-plugins-disk-checks* to your Gemfile and run `bundle install` or `bundle update`

#### Chef

Using the Sensu **sensu_gem** LWRP
```
sensu_gem 'sensu-plugins-gluster' do
  options('--prerelease')
  version '0.0.1'
end
```

Using the Chef **gem_package** resource
```
gem_package 'sensu-plugins-gluster' do
  options('--prerelease')
  version '0.0.1'
end
```

## Notes
