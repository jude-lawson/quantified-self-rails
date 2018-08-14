require 'rails_helper'

RSpec.describe Food do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:calories) }
  end

  describe 'Relationships' do
    it { should have_many(:meal_foods) }
    it { should have_many(:meals).through(:meal_foods) }
  end
end
