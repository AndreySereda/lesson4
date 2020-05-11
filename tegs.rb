# frozen_string_literal: true

module Company
  attr_accessor :company
  def initialize(name_company)
    @company = name_company
  end

  def create_name_company(name_company)
    @company = name_company
  end
end
