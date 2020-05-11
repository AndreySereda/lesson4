# frozen_string_literal: true

require_relative 'user.rb'
class Admin < User
  def initialize(name, surname, email)
    super
  end

  def type
    :admin
  end
end
