#! /usr/bin/env ruby
#
# metrics-vertx
#
# DESCRIPTION:
#  metrics-vertx get metrics from VertX
#
# OUTPUT:
#   metric-data
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: rest-clien
#
# USAGE:
#
#
# NOTES:
#
# LICENSE:
#   Zubov Yuri <yury.zubau@gmail.com> sponsored by Actility, https://www.actility.com
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/metric/cli'
require 'open3'
require 'socket'
require 'nori'
require 'nokogiri'
require 'sensu-plugins-gluster'

class MetricsGlusterVolumeProfile < Sensu::Plugin::Metric::CLI::Graphite
  include CommonGluster

  option :scheme,
         description: 'Metric naming scheme, text to prepend to metric',
         short: '-S SCHEME',
         long: '--scheme SCHEME',
         default: "#{Socket.gethostname}.gluster"

  option :name,
         description: 'Name of value',
         short: '-N NAME',
         long: '--name NAME',
         required: true

  def request
    stdout, result = Open3.capture2("gluster volume profile #{config[:name]} info cumulative --xml")
    unknown 'Unable to get gluster status' unless result.success?
    stdout
  end

  def nokogiri_parse
    xml_doc  = Nokogiri::XML(request)

    response = xml_doc.xpath('//volProfile').to_s
    response_hash = Nori.new.parse(response)['volProfile']
    [response_hash['brick']].flatten.map do |value|
      [
        value['brickName'],
        {
          'block.size' => array_to_naming_hash(value['cumulativeStats']['blockStats']['block'], 'size'),
          'fop.name' => array_to_naming_hash(value['cumulativeStats']['fopStats']['fop'], 'name'),
          'duration' => value['cumulativeStats']['duration'],
          'totalRead' => value['cumulativeStats']['duration'],
          'totalWrite' => value['cumulativeStats']['duration']
        }
      ]
    end.to_h
  end

  def run
    print_hash(nokogiri_parse)
    ok
  end
end
