# frozen_string_literal: true

class RecordsController < ApplicationController
  def create
    @record = Record.create(record_params)
    redirect_to new_records_activity_path(record_id: @record.id)
  end

  def new
    @condition = Condition.find(params[:condition_id])
  end

  def show
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    records_activities
    redirect_to new_records_medicine_path(record_id: @record.id)
  end

  private

  def records_activities
    update_params[:records_activity].each do |update_param|
      values = update_param.last
      next if values[:score].blank?

      RecordsActivity.create(record_id: @record.id, score: values[:score].to_i, activity_id: values[:activity_id])
    end
  end

  def record_params
    params.require(:record).permit(:side, :spreads, :condition_id)
  end

  def update_params
    params.require(:record).permit(records_activity: [:score, :activity_id])
  end
end
