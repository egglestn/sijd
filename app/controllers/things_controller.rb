# frozen_string_literal: true

class ThingsController < ApplicationController
  def create
    @record = Record.find(record_id)
    @thing = Thing.create(things_params)
    redirect_to new_medicine_path(record_id: @record.id)
  end

  def new; end

  def show
    @thing = Thing.find(params[:id])
  end

  def thing_params
    params.require(:thing).permit()
  end
end
