require_relative './spec_helper'
require_relative '../bin/metrics-gluster-volume-info'
require_relative './fixtures/metrics-gluster'

describe 'MetricsGlusterVolumeInfo' do
  before do
    MetricsGlusterVolumeInfo.class_variable_set(:@@autorun, false)
  end

  describe 'with positive answer' do
    before do
      @default_parameters = '--scheme=test'
      @metrics = MetricsGlusterVolumeInfo.new(@default_parameters.split(' '))
      allow(@metrics).to receive(:request).and_return(gluster_volume_info)
      allow(@metrics).to receive(:ok)
    end

    describe '#run' do
      it 'tests that a metrics are ok' do
        @output_result = {}
        allow(@metrics).to receive(:output).and_wrap_original do |_m, *args|
          @output_result[args[0]] = args[1]
        end

        @metrics.run
        expect(@output_result['test.main.statusStr']).to eq 'Started'
      end
    end
  end
end
