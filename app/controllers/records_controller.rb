# frozen_string_literal: true

class RecordsController < ApplicationController
  def create
    @record = Record.create(record_params)
    redirect_to new_records_thing_path(record_id: @record.id)
  end

  def new
    @condition = Condition.find(params[:condition_id])
  end

  def show
    @record = Record.find(params[:id])
  end

  def update
    puts "=========="
    puts params
    puts "-----------"
    puts update_params
    puts "========="
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:side, :spreads, :condition_id)
  end

  def update_params
    params.require(:record).permit(records_thing: [:score, :thing_id])
  end
end
