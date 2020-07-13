require 'rails_helper'

RSpec.describe RemoveOldServersJob, type: :job do
  include ActiveJob::TestHelper

  let(:job) { described_class.perform_later }

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end

  it 'queues the job' do
    expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in default queue' do
    expect(RemoveOldServersJob.new.queue_name).to eq('megamek_api_test_default')
  end

  it 'executes perform' do
    perform_enqueued_jobs { job }
    assert_performed_jobs 1
  end
end
