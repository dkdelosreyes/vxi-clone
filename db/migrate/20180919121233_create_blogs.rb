class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
    	t.string :title, limit: 50, null: false
    	t.text :description
    	t.integer :user_id
    	t.integer :status_id
      t.timestamps

      t.index :status_id
      t.index :user_id
    end
  end
end
