# frozen_string_literal: true

require_relative 'admin.rb'
require_relative 'customer'
require_relative 'survey'
require_relative 'question'
require_relative 'variants'
require_relative 'answer'

puts 'name survey'
name_survey = gets.chomp
survey_test = Survey.new(name_survey)
puts "survey #{name_survey} was created"
puts 'Print name who create survey'
name_company = gets.chomp
Survey.create_name_company(name_company)

loop do
  puts 'Print questions or (stop to end)'
  quest_text = gets.chomp
  break if quest_text == 'stop'
  question = Question.new(quest_text)
  survey_test.create_questions(question)
  puts 'print name of company who create Question'
  name_company = gets.chomp
  Question.create_name_company(name_company)
  loop do
    puts 'Print variants or (stop to end if variants more than 4)'
    variants_text = gets.chomp
    break if variants_text == 'stop'
    variants = Variants.new(variants_text)
    question.create_variants(variants)
    puts 'print name of company who create variant'
    name_company = gets.chomp
    variants.create_name_company(name_company)
    question.check_company
    if question.error
    end
  end
end



puts %( Do you want to see id questions or variants
 1 - Check id question
 2 - Check id variants
 3 - I don't want check id
)

selection = gets.chomp.to_i

if selection == 1
  puts %( 1 - check calculate question id
 2 - check all question id
 3 - check first question id
 4 - check last question id
 5 - seach question id using text
)
  choice = gets.chomp.to_i

  case choice

  when 1
    puts Question.calculate_id
  when 2
    puts Question.all
  when 3
    puts Question.first
  when 4
    puts Question.last
  when 5
    puts 'Enter the question text to find id'
    question = gets.chomp
    puts Question.find(text: question)
  end

elsif selection == 2
  puts %(1 - check calculate variants id
 2 - check all variants id
 3 - check first variants id
 4 - check last variants id
 5 - seach variant id using text
)
  pick = gets.chomp.to_i

  case pick

  when 1
    puts Variants.calculate_id
  when 2
    puts Variants.all
  when 3
    puts Variants.first
  when 4
    puts Variants.last
  when 5
    puts 'Enter the text of the variant by which we will find id'
    variant = gets.chomp
    puts Variants.find(text: variant)
  end
end

answers_sum = []
b = 0

puts %( 1 - Create user - Admin
 2 - Create user - Customer
)

status = gets.chomp.to_i

case status

when 1
  puts 'Your email'
  email = gets.chomp
  puts 'Your name'
  name = gets.chomp
  puts 'Your surname'
  surname = gets.chomp
  user_admin = Admin.new(email, name, surname)

when 2
  puts 'Your email'
  email = gets.chomp
  puts 'Your name'
  name = gets.chomp
  puts 'Your surname'
  surname = gets.chomp
  user_customer = Customer.new(email, name, surname)
end

puts 'Start Test'
survey_test.questions_arr.each do |question|
  puts question.variants
  puts 'Print variants'
  question.variants_arr.each do |variant|
    print variant.variant_id.to_s + ')'
    puts variant.text
  end

  selected_variant = gets.to_i
  question.variants_arr.each do |variant|
    next unless variant.variant_id == selected_variant

    selected_variant = variant.range
    answer = Answer.new(selected_variant)
    answers_sum << selected_variant
  end
end
answers_sum.map { |a| b += a }
puts "Yours result #{b}"
