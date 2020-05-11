# frozen_string_literal: true

class Question
  extend Company
  include Activable
  class LimitError < StandardError; end
  class InvalidName < StandardError; end

  attr_accessor :text, :variants, :variants_arr, :id
  def initialize(variants)
    register_instances
    @text = text
    @variants = variants
    @variants_arr = []
  end

  def create_variants(variants)
    @variants_arr << variants
  end

  def error
    if @variants_arr.size > 3
      raise LimitError, 'Cannot have more than 4 variants(Print stop)'
    end
  rescue LimitError => e
    puts e.message
  end

  def check_company
    @variants_arr.map do |variant|
      if variant.company == @company
        raise InvalidName 'you cannot use this name for company'
      end
    end
  end

  def delete_variants(condition)
    @variants_arr.delete_if { |element| element.id == condition || element.variants == condition }
  end
end
