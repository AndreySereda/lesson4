# frozen_string_literal: true

require_relative 'user.rb'
class Customer < User
  def initialize(name, surname, email)
    super
  end

  def type
    :customer
  end
end
