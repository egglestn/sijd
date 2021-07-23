# frozen_string_literal: true

class RecordsTreatmentsController < ApplicationController
  def new
    @record = Record.find(params[:record_id])
  end
end
