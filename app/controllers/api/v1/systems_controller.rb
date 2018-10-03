class Api::V1::SystemsController < ApplicationController
  def index
    @systems = System.order(:id).page(params[:page])
  end

  def show
    @system = System.includes(:factories, :system_owner_eras, :system_occupation_dates).find(params[:id])
  end
end
