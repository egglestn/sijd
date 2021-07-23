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
    return_path = records_activities if update_params[:records_activity]
    return_path = records_medicines if update_params[:records_medicine]

    redirect_to return_path || root_path
  end

  private

  def records_activities
    update_params[:records_activity].each do |update_param|
      values = update_param.last
      next if values[:score].blank?

      RecordsActivity.create(record_id: @record.id, score: values[:score].to_i, activity_id: values[:activity_id])
    end

    new_records_medicine_path(record_id: @record.id)
  end

  def records_medicines
    update_params[:records_medicine].each do |update_param|
      values = update_param.last
      next if values[:score].blank?

      RecordsMedicine.create(record_id: @record.id, score: values[:score].to_i, medicine_id: values[:medicine_id], side_effects: values[:side_effects])
    end

    new_records_medicine_path(record_id: @record.id)
  end

  def record_params
    params.require(:record).permit(:side, :spreads, :condition_id)
  end

  def update_params
    params.require(:record).permit(records_activity: [:score, :activity_id], records_medicine: [:score, :side_effects, :medicine_id])
  end
end
