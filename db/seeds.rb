# Delete all data and reset auto increments
models = [ User, 
						Blog,
						Status ]

models.each do |model|
	model.delete_all
	ActiveRecord::Base.connection.execute("Delete from #{model.table_name}")
	ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE WHERE name='#{model.table_name}'")
end

# Seeding of data

# Status
Status.create( title: 'Active', code: 'active')
Status.create( title: 'Inactive', code: 'inactive' )

# Users
password = "password"
User.create( email: "a@a.com",
							password: password,
							password_confirmation: password,
							first_name: "Admin",
							last_name: "Istrator",
							status_id: 1 
							)