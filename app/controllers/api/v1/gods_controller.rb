# frozen_string_literal: true

# GodsController
# API endpoint for grabing data on all the gods in the system. Original data
# captured from GodChecker
class Api::V1::GodsController < Api::ApiController
  def index
    @gods = God.order(:name).page(params[:page]).per(200)
  end
end
