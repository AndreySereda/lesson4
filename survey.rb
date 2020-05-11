# frozen_string_literal: true
require_relative 'findable.rb'
require_relative 'tegs.rb'

class Survey
  extend Company
  include Activable
  attr_accessor :name_survey, :questions_arr, :id
  def initialize(name_survey)
    register_instances
    @name_survey = name_survey
    @questions_arr = []
  end

  def create_questions(question)
    @questions_arr << question
  end

  def show_questions
    puts @questions_arr
  end

  def show_questions_with_variants
    hash = @questions_arr.zip(@variants_arr).each_with_object({}) { |pair, hash| hash[pair[0]] = pair[1] }
    puts hash
  end
end
