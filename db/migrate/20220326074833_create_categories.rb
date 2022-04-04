class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|

      t.timestamps
      t.string :name
      t.integer :user_id
      t.integer :post_image_id
    end
  end
end
