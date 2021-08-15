# frozen_string_literal: true

class InvitesController < ApplicationController
  before_action :set_invite, only: %i[show update]

  def create
    @invite = Invite.new(invite_params)

    if @invite.save
      InviteMailer.with(invite: @invite).invite_email.deliver_now
      redirect_to invites_url
    else
      render :new
    end
  end

  def index
    @invites = Invite.where(invited_by_user: current_user).order(:created_at)
  end

  def new
    @invite = Invite.new
  end

  def show; end

  def invite_user_params
    email = @invite.invite_email
    group_id = @invite.invited_by_user.group_id
    password = params['invite'].delete('password')
    # binding.pry
    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.group_id = group_id
      user.streaming_services = []
    end
  end

  def update
    # user_params = {
    #   email: @invite.invite_email,
    #   password: params['invite']['password'],
    #   group_id: @invite.invited_by_user.group_id
    # }

    # user = User.new(user_params)
    user = invite_user_params
    # binding.pry
    if user.save
      @invite.update(token: nil)
      sign_in user
      redirect_back_or url_after_create
    else
    # binding.pry
      render template: "users/new"
    end
    # send welcome email
    # if user.save
    #   @invite.update(token: nil)
    #   # redirect_to root_path
    #   redirect_to new_user_path, params: { user: user_params }
    #   # redirect_to movies_path
    # else
    #   render :edit
    # end
  end

  private

  def set_invite
    @invite = if params['action'] == 'show'
                Invite.find_by(token: params['id'])
              else
                Invite.find_by(id: params['id'])
              end
  end

  def invite_params
    p = params.require(:invite).permit(:invite_email, :invite_name)
    p.merge(
      invited_by_user_id: current_user.id,
      # group_id: current_user.group_id,
      token: SecureRandom.hex(10),
      token_expires_at: 30.days.from_now
    )
  end

  def user_params
    params[Clearance.configuration.user_parameter]
  end
end
