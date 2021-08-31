require 'rails_helper'

# Test suite for the Pokemon model
RSpec.describe Pokemon, type: :model do
  # Validation tests
  # ensure columns name and number are present on create before saving
  it { should validate_presence_of(:name).on(:create) }
  it { should validate_presence_of(:number).on(:create) }
end
