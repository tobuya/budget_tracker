class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :categories, dependent: :destroy
  has_many :purchases, foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true, uniqueness: { case_insensitive: false }
end
