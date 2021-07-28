# frozen_string_literal: true

class VitaminsController < ApplicationController
  def index
    @vitamins = Vitamin.all.order(:name)
    @records = Record.all.includes(:records_vitamins).order(created_at: :desc).limit(30)
    vitamins_map
  end

  private

  def vitamins_map
    @positive_map = []
    @negative_map = []
    @vitamins.each do |vitamin|
      vitamin_map(vitamin)
    end
  end

  def vitamin_map(vitamin)
    pos = 0
    neg = 0
    RecordsVitamin.where(vitamin_id: vitamin.id).each do |ra|
      score = ra.score
      pos += 1 if %w[occasionally frequently].include? score
      neg -= 1 if score == "tried_but_stopped"
    end
    @positive_map << pos
    @negative_map << neg
  end
end
