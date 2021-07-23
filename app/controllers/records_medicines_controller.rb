# frozen_string_literal: true

class RecordsMedicinesController < ApplicationController
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
