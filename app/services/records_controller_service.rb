# frozen_string_literal: true

module RecordsControllerService
  module_function

  include Rails.application.routes.url_helpers

  def records_treatments(params)
    params.each do |param|
      next if param.first == "record_id"

      values = param.last
      next if values[:score].blank?

      RecordsTreatment.create(record_id: params[:record_id], score: values[:score].to_i,
                              treatment_id: values[:treatment_id], side_effects: values[:side_effects])
    end

    "/records/#{params[:record_id]}"
  end

  def records_vitamins(params)
    params.each do |param|
      next if param.first == "record_id"

      values = param.last
      next if values[:score].blank?

      RecordsVitamin.create(record_id: params[:record_id], score: values[:score].to_i,
                            vitamin_id: values[:vitamin_id], side_effects: values[:side_effects])
    end

    "/records_treatments/new?record_id=#{params[:record_id]}"
  end

  def records_medicines(params)
    params.each do |param|
      next if param.first == "record_id"

      values = param.last
      next if values[:score].blank?

      RecordsMedicine.create(record_id: params[:record_id], score: values[:score].to_i,
                             medicine_id: values[:medicine_id], side_effects: values[:side_effects])
    end

    "/records_vitamins/new?record_id=#{params[:record_id]}"
  end

  def records_activities(params)
    params.each do |param|
      next if param.first == "record_id"

      values = param.last
      next if values[:score].blank?

      RecordsActivity.create(record_id: params[:record_id], score: values[:score].to_i,
                             activity_id: values[:activity_id])
    end

    "/records_medicines/new?record_id=#{params[:record_id]}"
  end
end
