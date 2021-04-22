class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|

      t.text :practice_name
      t.string :image_id
      t.text :tweet
      t.integer :admin_id
      t.timestamps
    end
  end
end
