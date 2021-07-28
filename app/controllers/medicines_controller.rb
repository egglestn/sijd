# frozen_string_literal: true

class MedicinesController < ApplicationController
  def index
    @medicines = Medicine.all.order(:name)
    @records = Record.all.order(created_at: :desc).limit(30)
    medicine_map
  end

  private

  def medicine_map
    @positive_map = []
    @negative_map = []
    @medicines.each do |medicine|
      pos = 0
      neg = 0
      RecordsMedicine.where(medicine_id: medicine.id).each do |ra|
        score = ra.read_attribute_before_type_cast(:score)
        pos += 1 if score > 2
        neg -= 1 if score < 2
      end
      @positive_map << pos
      @negative_map << neg
    end
  end
end
