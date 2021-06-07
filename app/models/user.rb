# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User
  belongs_to :partner_user, class_name: 'User'
end
