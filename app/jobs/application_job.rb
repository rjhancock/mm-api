# frozen_string_literal: true

require 'open-uri'

# Base class for ActiveJob
class ApplicationJob < ActiveJob::Base
  def fix_url(link)
    url = link['href']
    url = "https://isatlas.teamspam.net#{url}" unless !!(url =~ /^http/)
    url
  end
end
