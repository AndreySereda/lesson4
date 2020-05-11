# frozen_string_literal: true

class User
  @@last_id = 0
  attr_accessor :name, :surname, :email
  def initialize(name, surname, email)
    @id = (@@last_id += 1)
    @name = name
    @surname = surname
    @email = email
  end
end
