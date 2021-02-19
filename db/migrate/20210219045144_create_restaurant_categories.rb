class CreateRestaurantCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurant_categories do |t|
      t.belongs_to :review, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
