FactoryBot.define do
  factory :user do
    name { 'Test User' }
    email { 'user@example.com' }
    password_digest { 'password123' }
  end

  factory :category do
    name { 'Category Name' }
    icon { 'Category Icon' }
    user
  end

  factory :transaction do
    name { 'Transaction Name' }
    amount { 45.50 }
    user
    category
  end
end
