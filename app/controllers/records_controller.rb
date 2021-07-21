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
    @record = Record.find(params[:id])
    records_things
    redirect_to root_path
  end

  private

  def records_things
    update_params[:records_thing].each do |update_param|
      values = update_param.last
      next if values[:score].blank?

      RecordsThing.create(record_id: @record.id, score: values[:score].to_i, thing_id: values[:thing_id])
    end
  end

  def record_params
    params.require(:record).permit(:side, :spreads, :condition_id)
  end

  def update_params
    params.require(:record).permit(records_thing: [:score, :thing_id])
  end
end
