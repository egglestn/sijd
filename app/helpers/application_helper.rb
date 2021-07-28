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

  def score_to_sym(score)
    case score
    when 0
      "- -"
    when 1
      "-"
    when 2
      "o"
    when 3
      "+"
    when 4
      "++"
    else
      ""
    end
  end
end
