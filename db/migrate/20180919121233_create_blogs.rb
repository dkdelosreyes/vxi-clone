class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
    	t.string :title, limit: 50, null: false
    	t.longtext :description
    	t.integer :user_id
      t.timestamps
    end
  end
end
