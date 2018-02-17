require 'rails_helper'

RSpec.describe RemoveOldServersJob, type: :job do
  include ActiveJob::TestHelper

  subject(:job) { described_class.perform_later }

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in urgent queue' do
    expect(RemoveOldServersJob.new.queue_name).to eq('default')
  end

  it 'executes perform' do
    expect(Server).to receive(:where)
    perform_enqueued_jobs { job }
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end
