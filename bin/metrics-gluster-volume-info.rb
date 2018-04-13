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

class MetricsGlusterVolumeInfo < Sensu::Plugin::Metric::CLI::Graphite
  include CommonGluster

  option :scheme,
         description: 'Metric naming scheme, text to prepend to metric',
         short: '-S SCHEME',
         long: '--scheme SCHEME',
         default: "#{Socket.gethostname}.gluster"

  def request
    stdout, result = Open3.capture2('gluster volume info --xml')
    unknown 'Unable to get gluster status' unless result.success?
    stdout
  end

  def nokogiri_parse
    xml_doc  = Nokogiri::XML(request)

    response = xml_doc.xpath('//volumes').to_s
    response_hash = Nori.new.parse(response)['volumes']
    array_to_naming_hash(
      [response_hash['volume']].flatten,
      'name',
      %w[
        name status statusStr snapshotCount brickCount distCount
        stripeCount replicaCount arbiterCount disperseCount redundancyCount
      ]
    ).merge('volumes.count' => response_hash['count'])
  end

  def run
    print_hash(nokogiri_parse)
    ok
  end
end
