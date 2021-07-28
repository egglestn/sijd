# frozen_string_literal: true

class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all.order(:name)
    @records = Record.all.order(created_at: :desc).limit(30)
    activity_map
  end

  private

  def activity_map
    @positive_map = []
    @negative_map = []
    @activities.each do |activity|
      pos = 0
      neg = 0
      RecordsActivity.where(activity_id: activity.id).each do |ra|
        score = ra.read_attribute_before_type_cast(:score)
        pos += 1 if score > 2
        neg -= 1 if score < 2
      end
      @positive_map << pos
      @negative_map << neg
    end
  end
end
