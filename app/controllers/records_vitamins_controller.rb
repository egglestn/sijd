# frozen_string_literal: true

class RecordsVitaminsController < ApplicationController
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
