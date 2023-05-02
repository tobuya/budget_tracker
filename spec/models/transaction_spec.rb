require 'spec_helper'

RSpec.describe Transaction, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user: user) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
  end

  describe 'factories' do
    it 'has a valid factory' do
      transaction = FactoryBot.build(:transaction, user: user, category: category)
      expect(transaction).to be_valid
    end
  end
end
