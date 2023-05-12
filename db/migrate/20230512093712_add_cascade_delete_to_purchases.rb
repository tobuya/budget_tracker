class AddCascadeDeleteToPurchases < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :purchases, :categories
    add_foreign_key :purchases, :categories, on_delete: :cascade
  end
end
