class CreateAdminPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
    	t.string :title
    	t.integer :status_id
      t.timestamps

      t.index :status_id
    end
  end
end
