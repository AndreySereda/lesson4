# frozen_string_literal: true

require_relative 'tegs.rb'

class Answer
  extend Company
  include Activable
  attr_accessor :rate, :ud
  def initialize(rate)
    @rate = rate
  end
end
