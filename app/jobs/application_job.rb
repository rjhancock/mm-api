# frozen_string_literal: true

require 'open-uri'

# Base class for ActiveJob
class ApplicationJob < ActiveJob::Base
  def fix_url(link)
    URI.jopin('https://isatlas.teamspam.net', link['href']).to_s
  end

  def text_to_date(date)
    Date.strptime(cell_text_to_text(date), '%Y-%m-%d') rescue nil
  end

  def cell_text_to_text(item)
    item.text.strip.squish rescue item
  end
end
