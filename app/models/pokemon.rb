class Pokemon < ApplicationRecord
  # validations
  validates_presence_of :number, :name, on: :create
end
