# frozen_string_literal: true

class RecordsThingsController < ApplicationController
  def create
    RecordsThing.create(record_thing_params)
    redirect_to new_medicines_records_path(record_id: @record.id)
  end

  def new
    @record = Record.find(params[:record_id])
  end

  def show
    @record = Record.find(params[:id])
  end

  def record_thing_params
    params.require(:records_thing).permit(:score, :record_id, :thing_id)
  end
end
