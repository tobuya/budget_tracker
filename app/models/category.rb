class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :purchases, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true

  def total_purchase
    purchases.sum(:amount)
  end
end
