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
    return_path = create_join_entries_and_return

    redirect_to return_path
  end

  def index
    @records = Record.all.order(:created_at).limit(30)
  end

  private

  # rubocop:disable Metrics/AbcSize
  def create_join_entries_and_return
    return RecordsControllerService.records_activities(activity_params) if update_params[:records_activity]

    return RecordsControllerService.records_medicines(medicine_params) if update_params[:records_medicine]

    return RecordsControllerService.records_vitamins(vitamin_params) if update_params[:records_vitamin]

    return RecordsControllerService.records_treatments(treatment_params) if update_params[:records_treatment]

    root_path
  end
  # rubocop:enable Metrics/AbcSize

  def activity_params
    update_params[:records_activity].merge(record_id: @record.id)
  end

  def medicine_params
    update_params[:records_medicine].merge(record_id: @record.id)
  end

  def vitamin_params
    update_params[:records_vitamin].merge(record_id: @record.id)
  end

  def treatment_params
    update_params[:records_treatment].merge(record_id: @record.id)
  end

  def record_params
    params.require(:record).permit(:side, :spreads, :condition_id)
  end

  def update_params
    params.require(:record).permit(records_activity: %i[score activity_id],
                                   records_medicine: %i[score side_effects
                                                        medicine_id],
                                   records_vitamin: %i[score side_effects
                                                       vitamin_id],
                                   records_treatment: %i[score side_effects
                                                         treatment_id])
  end
end
