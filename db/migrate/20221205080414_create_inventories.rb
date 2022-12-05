class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.float :price
      t.decimal :qty

      t.timestamps
    end
  end
end
