# frozen_string_literal: true

class Invite < ApplicationRecord
  belongs_to :invited_by_user, class_name: 'User'
end
