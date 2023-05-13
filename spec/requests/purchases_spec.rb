require 'rails_helper'

RSpec.describe 'Purchases', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(name: 'Johnab', email: 'johnab@example.com', password: 'password123') }
  let(:category) { Category.create!(user: user, name: 'Entertainment', icon: '🎭') }
  let(:purchase) { Purchase.create!(user: user, name: 'Television', amount: 2500, category_id: category.id) }

  let(:valid_params) { { category_ids: [category.id], name: 'Radio', amount: 150 } }
  let(:invalid_params) { { category_ids: [], amount: 254 } }

  before do
    sign_in user
  end

  describe 'GET / purchase#new ' do
    it 'should render' do
      get new_category_purchase_path(category)
      expect(response).to render_template(:new)
    end

    it 'should return a 200 OK status' do
      get new_category_purchase_path(category)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST / purchase#create' do
    context 'with valid params' do
      it 'should create a purchase' do
        expect do
          post category_purchases_path(category), params: { purchase: valid_params }
        end.to change(Category, :count).by(1)
      end

      it 'should redirect to the purchase#show page' do
        post category_purchases_path(category), params: { purchase: valid_params }
        expect(response).to redirect_to(category_path(category))
      end
    end

    context 'with invalid params' do
      it 'should not create a purchase' do
        expect do
          post category_purchases_path(category), params: { purchase: invalid_params }
        end.to change(Category, :count).by(1)
      end

      it 'should redirect to the purchase#new page' do
        post category_purchases_path(category), params: { purchase: invalid_params }
        expect(response).to redirect_to(new_category_purchase_path)
      end
    end
  end

  describe 'DELETE / purchase#destroy' do
    it 'should destroy a purchase' do
      new_purchase = Purchase.create!(user: user, category_id: category.id, name: 'New purchase', amount: 85)
      expect do
        delete category_purchase_path(category, new_purchase)
      end.to change(Category, :count).by(0)
    end
  end
end
