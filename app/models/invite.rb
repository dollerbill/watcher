# frozen_string_literal: true

# == Schema Information
#
# Table name: invites
#
#  id                 :bigint           not null, primary key
#  invite_name        :string           not null
#  invite_email       :citext           not null
#  token              :string           not null
#  invited_by_user_id :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  accepted_at        :datetime
#  token_expires_at   :datetime         not null
#
class Invite < ApplicationRecord
  belongs_to :invited_by_user, class_name: 'User'
end
