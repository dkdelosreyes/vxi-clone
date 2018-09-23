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
user = User.create( email: "a@a.com",
							password: password,
							password_confirmation: password,
							first_name: "Admin",
							last_name: "Istrator",
							status_id: 1 
							)

# Blogs
Blog.create( 
			title: 'PEOPLE OF VXI: FOR PAUL, SUCCESS IS EQUAL PARTS PASSION AND PERSEVERANCE',
    	description: 'description here',
    	user_id: user.id,
    	status_id: 1
						)

Blog.create( 
			title: '2 PEOPLE OF VXI: FOR PAUL, SUCCESS IS EQUAL PARTS PASSION AND PERSEVERANCE',
    	description: '2 description here',
    	user_id: user.id,
    	status_id: 1
						)

Blog.create( 
			title: '3 PEOPLE OF VXI: FOR PAUL, SUCCESS IS EQUAL PARTS PASSION AND PERSEVERANCE',
    	description: '3 description here',
    	user_id: user.id,
    	status_id: 1
						)