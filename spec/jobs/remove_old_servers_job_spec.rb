require 'rails_helper'

RSpec.describe RemoveOldServersJob, type: :job do
  include ActiveJob::TestHelper

  after do
    clear_enqueued_jobs
  end

  it 'queues the job' do
    expect { RemoveOldServersJob.perform_later }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'executes perform' do
    ActiveJob::Base.queue_adapter = :test
    ActiveJob::Base.queue_adapter.perform_enqueued_jobs = true
    expect { RemoveOldServersJob.perform_later }.to have_performed_job(RemoveOldServersJob)
  end
end
