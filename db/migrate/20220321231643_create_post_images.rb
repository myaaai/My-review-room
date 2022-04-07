class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|

      t.integer :category_id
      t.string :title
      t.string :review
      t.integer :user_id
      t.string :memo
      t.string :image
      t.timestamps
    end
  end
end
