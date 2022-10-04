# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, uniqueness: true
  validates_presence_of :email, :first_name, :last_name
end
