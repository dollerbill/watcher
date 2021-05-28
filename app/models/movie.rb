# frozen_string_literal: true

class Movie < ApplicationRecord
  def like?(player)
    send("#{player}_reaction") == 'thumbs_up'
  end

  def match?
    like?('user_1') && like?('user_2')
  end
end
