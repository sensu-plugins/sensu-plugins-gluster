require_relative './spec_helper'
require_relative '../bin/metrics-gluster-peer-status'
require_relative './fixtures/metrics-gluster'

describe 'MetricsGlusterPeerStatus' do
  before do
    MetricsGlusterPeerStatus.class_variable_set(:@@autorun, false)
  end

  describe 'with positive answer' do
    before do
      @default_parameters = '--scheme=test'
      @metrics = MetricsGlusterPeerStatus.new(@default_parameters.split(' '))
      allow(@metrics).to receive(:request).and_return(gluster_peer_status)
      allow(@metrics).to receive(:ok)
    end

    describe '#run' do
      it 'tests that a metrics are ok' do
        @output_result = {}
        allow(@metrics).to receive(:output).and_wrap_original do |_m, *args|
          @output_result[args[0]] = args[1]
        end

        @metrics.run
        expect(@output_result['test.ea79a5ef-909a-456d-8862-40705229e06c.state']).to eq '3'
      end
    end
  end
end
