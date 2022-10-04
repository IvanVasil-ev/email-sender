# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome_email(email, name, unsub_url)
    @name = name
    @unsub_url = unsub_url

    mail(to: email, subject: 'Welcome to Email Newsletter!')
  end

  def verification_email(email, name, url)
    @name = name
    @url = url

    mail(to: email, subject: 'Need to verify!')
  end
end
