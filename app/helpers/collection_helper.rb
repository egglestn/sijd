# frozen_string_literal: true

module CollectionHelper

  def human_keys(keys)
    keys.map do |key|
     [key.humanize, key]
    end
  end
end
