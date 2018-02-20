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
    expect(RemoveOldServersJob.new.queue_name).to eq('default')
  end

  pending 'Need to figure out WHY this wont work'
#  it 'executes perform' do
#    expect(Server).to receive(:where)
#    expect(Server).to receive(:delete_all)
#    perform_enqueued_jobs { RemoveOldServersJob.perform_now }
#  end
end
