class Category < ApplicationRecord
  belongs_to :user
  has_many :category_transactions, dependent: :destroy
  has_many :transactions, through: :category_transactions, source :category

  validates :name, presence: true
  validates :icon, presence: true
end
