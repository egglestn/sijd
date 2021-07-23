# frozen_string_literal: true

class RecordsMedicinesController < ApplicationController
  def create
    RecordsMedicine.create(record_medicine_params)
    redirect_to new_records_medicines_path(record_id: @record.id)
  end

  def new
    @record = Record.find(params[:record_id])
  end

  def show
    @record = Record.find(params[:id])
  end

  def record_medicine_params
    params.require(:records_medicine).permit(:score, :record_id, :medicine_id)
  end
end
