require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(name: 'Jonah', email: 'jonah@example.com', password: 'password123') }
  let(:category) { Category.create!(user: user, name: 'Entertainment', icon: '🎭') }

  let(:valid_params) { { name: 'Entertainment', icon: '🎭' } }
  let(:invalid_params) { { name: nil, icon: '🎭' } }

  before do
    sign_in user
  end

  describe 'GET /index ' do
    it 'should render' do
      get categories_path
      expect(response).to render_template(:index)
    end

    it 'should return a 200 OK status' do
      get categories_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show ' do
    it 'should render' do
      get category_path(category)
      expect(response).to render_template(:show)
    end

    it 'should return a 200 OK status' do
      get category_path(category)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /new ' do
    it 'should render' do
      get new_category_path
      expect(response).to render_template(:new)
    end

    it 'should return a 200 OK status' do
      get new_category_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    context 'with valid params' do
      it 'should create a category' do
        expect do
          post categories_path, params: { category: valid_params }
        end.to change(Category, :count).by(1)
      end

      it 'should redirect to the categories#index page' do
        post categories_path, params: { category: valid_params }
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'with invalid params' do
      it 'should not create a category' do
        expect do
          post categories_path, params: { category: invalid_params }
        end.to change(Category, :count).by(0)
      end

      it 'should redirect to the category#new page' do
        post categories_path, params: { category: invalid_params }
        expect(response).to redirect_to(new_category_path)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'should destroy a category' do
      new_category = Category.create!(user: user, name: 'Entertainment', icon: '🎭')
      expect do
        delete category_path(new_category)
      end.to change(Category, :count).by(-1)
    end

    it 'should redirect to the categories#index page' do
      delete category_path(category)
      expect(response).to redirect_to(categories_path)
    end
  end
end
