require 'rails_helper'

RSpec.describe Food do
  describe 'Validations' do
    it{ should validate_presence_of(:name) }
    it{ should validate_presence_of(:calories) }
  end
end
