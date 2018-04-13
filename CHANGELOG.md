#Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed at [Keep A Changelog](http://keepachangelog.com/)

## [Unreleased]
### Breaking Changes
- dropped ruby 2.0 support (@yuri-zubov sponsored by Actility, https://www.actility.com)
- added `nokogiri` as a dependency which requires you to have a local c compiler present to install this plugin (@yuri-zubov sponsored by Actility, https://www.actility.com)
- added `nori` as a dependency which requires you to have a local c compiler present to install this plugin (@yuri-zubov sponsored by Actility, https://www.actility.com)

### Security
- updated yard dependency to `~> 0.9.11` per: https://nvd.nist.gov/vuln/detail/CVE-2017-17042 (@yuri-zubov sponsored by Actility, https://www.actility.com)
- updated rubocop dependency to `~> 0.51.0` per: https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-8418. (@yuri-zubov sponsored by Actility, https://www.actility.com)

### Added
- Added ability to get metrics from gluster (@yuri-zubov sponsored by Actility, https://www.actility.com)

## [1.0.0] - 2017-07-15
### Added
- Ruby 2.3.0 testing
- Ruby 2.4.1 testing

### Breaking Change
- Remove support for Ruby 1.9.3

## [0.0.3] - 2015-10-15
### Changed
- Added check-gluster-status.rb

## [0.0.2] - 2015-07-14
### Changed
- updated sensu-plugin gem to 1.2.0

## 0.0.1 - 2015-06-04

### Added
- initial release

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-gluster/compare/1.0.0...HEAD
[1.0.0]: https://github.com/sensu-plugins/sensu-plugins-gluster/compare/0.0.3...1.0.0
[0.0.3]: https://github.com/sensu-plugins/sensu-plugins-gluster/compare/0.0.2...0.0.3
[0.0.2]: https://github.com/sensu-plugins/sensu-plugins-gluster/compare/0.0.1...0.0.2
