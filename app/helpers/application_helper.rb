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
end
