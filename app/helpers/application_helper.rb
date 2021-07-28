# frozen_string_literal: true

module ApplicationHelper
  def score_to_num(score)
    case score
    when 0
      "zero"
    when 1
      "one"
    when 2
      "two"
    when 3
      "three"
    when 4
      "four"
    else
      ""
    end
  end

  def med_score_to_num(score)
    case score
    when "tried_but_stopped"
      "one"
    when "occasionally"
      "three"
    when "frequently"
      "four"
    else
      ""
    end
  end
end
