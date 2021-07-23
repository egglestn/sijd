# frozen_string_literal: true

class RecordsActivitiesController < ApplicationController
  def create
    RecordsActivity.create(record_activity_params)
    redirect_to new_medicines_records_path(record_id: @record.id)
  end

  def new
    @record = Record.find(params[:record_id])
  end

  def show
    @record = Record.find(params[:id])
  end

  def record_activity_params
    params.require(:records_activity).permit(:score, :record_id, :activity_id)
  end
end
