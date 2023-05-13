class AddCategoryIdToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchases, :category, null: false, foreign_key: true
  end
end
