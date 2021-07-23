# frozen_string_literal: true

class RecordsVitaminsController < ApplicationController
  def create
    RecordsVitamin.create(record_vitamin_params)
    redirect_to new_records_vitamins_path(record_id: @record.id)
  end

  def new
    @record = Record.find(params[:record_id])
  end

  def show
    @record = Record.find(params[:id])
  end

  def record_vitamin_params
    params.require(:records_vitamin).permit(:score, :record_id, :vitamin_id)
  end
end
