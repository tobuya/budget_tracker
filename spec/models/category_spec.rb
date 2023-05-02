require 'spec_helper'

RSpec.describe Category, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:category_transactions).dependent(:destroy) }
    it { should have_many(:transactions).through(:category_transactions).source(:category) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:icon) }
  end
end
