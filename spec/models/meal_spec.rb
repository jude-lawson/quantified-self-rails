require 'rails_helper'

RSpec.describe Meal do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
  
  describe 'Relationships' do
    it { should have_many(:meal_foods) }
    it { should have_many(:meals).through(:meal_foods) }
  end
end
