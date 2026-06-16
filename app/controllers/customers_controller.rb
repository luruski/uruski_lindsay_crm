class CustomersController < ApplicationController
  # Homepage: show every customer
  def index
    @customers = Customer.all
  end

  # Show every customer, sorted alphabetically by name
  def alphabetized
    @customers = Customer.order(:full_name)
  end

  # Show only customers who have no email address
  def missing_email
    @customers = Customer.where(email: [nil, ""])
  end
end
