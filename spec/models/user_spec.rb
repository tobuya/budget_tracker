require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'should have many categories' do
      user = FactoryBot.create(:user)
      FactoryBot.create(:category, user: user)
      expect(user).to have_many(:categories)
    end

    it 'should have many transactions' do
      user = FactoryBot.create(:user)
      category = FactoryBot.create(:category, user: user)
      FactoryBot.create(:transaction, category: category, user: user)
      expect(user).to have_many(:transactions)
    end
  end
end
