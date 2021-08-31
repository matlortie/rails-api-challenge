class Pokemon < ApplicationRecord
  # validations
  validates_presence_of :name, on: :create
end
