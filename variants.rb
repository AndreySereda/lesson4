# frozen_string_literal: true

require_relative 'tegs.rb'

class Variants
  include Company
  include Activable
  @@for_change = 0
  attr_accessor :text, :range, :id, :variant_id
  def initialize(text)
    register_instances
    @text = text
    @variant_id = (@@for_change += 1)
    @range = rand(1..10)
  end

end
