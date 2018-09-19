class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
    	t.string :title, null: false, limit: 50, comment: "Active, Inactive"
      t.string :code, null: false, limit: 50, comment: "active, inactive"
      t.timestamps
    end
  end
end
