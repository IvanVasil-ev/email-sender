# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :verify_token, only: %i[congratulations verification cancel canceled unsubscribe]

  def index; end

  def verification; end

  def cancel; end

  def congratulations
    user = User.where(is_confirmed: false, email: @email).first
    return unless user

    name = user.first_name
    user.update!(is_confirmed: true, confirmed_at: Time.now, ip: request.remote_ip)
    unsub_url = "#{ENV.fetch('APPLICATION_PATH', nil)}unsubscribe/#{@token}"

    UserMailer.with(email: @email, name:, unsub_url:)
              .welcome_email(@email, name, unsub_url)
              .deliver_later!(wait: 24.hours)
  end

  def subscribe
    email = params['email']
    first_name = params['first_name']
    last_name = params['last_name']

    user = User.where(is_confirmed: false, email:).first
    user ||= User.new(email:, first_name:, last_name:)

    encoded = ConfirmationLink.generate_link(email)
    encoded_email = encoded[:url]

    if user.save!
      UserMailer.with(email:, name: first_name, url: encoded_email)
                .verification_email(email, first_name, encoded_email)
                .deliver_now!

      redirect_to verification_path token: encoded[:token]
    else
      render root_path
    end
  end

  def unsubscribe
    user = User.where(is_confirmed: true, email: @email).first

    if user
      user.update!(is_confirmed: false, confirmed_at: nil, ip: nil)

      redirect_to canceled_path(@token)
    else
      redirect_to root_path
    end
  end

  private

  def verify_token
    @token = params['token']
    @email = ConfirmationLink.decode(@token)['email']

    redirect_to root_path if @email.empty? || @email.nil?
  end
end
