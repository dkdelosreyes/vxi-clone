# Delete all data and reset auto increments
# models = [ User, 
# 						Blog,
# 						Status,
# 						Location,
# 						Position,
# 						Education,
# 						Experience,
# 						SourceInfo ]

# models.each do |model|
# 	model.delete_all
# 	ActiveRecord::Base.connection.execute("Delete from #{model.table_name}")
# 	ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE WHERE name='#{model.table_name}'")
# end

# # Active Storage data clearing
# active_storage_tbls = [ 'active_storage_blobs', 'active_storage_attachments' ]
# active_storage_tbls.each do |tbls|
# 	ActiveRecord::Base.connection.execute("Delete from #{tbls}")
# 	ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE WHERE name='#{tbls}'")
# end
# FileUtils.rm_rf(Dir['storage/*']) 

# Seeding of data
# test
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

# Locations
locations = ['North EDSA, Quezon City', 'EDSA Buendia, Makati City', 'MOA Complex, Pasay City', 'Robinsons Cybergate, Davao City', 'SM Ecoland, Davao City', 'Felcris Centrale, Davao City', 'SM City Clark, Angeles City']
locations.each do |i|
	Location.create( title: i, status_id: 1 )
end

# Positions
positions = ['Sales Associate', 'Tech Support Associate', 'Customer Service Associate']
positions.each do |i|
	Position.create( title: i, status_id: 1 )
end


# Educations
educations = ['High school graduate', 'K-12 Graduate', 'College graduate', 'Undergrad below 2 years', 'Undergrad 2 years and up', 'Post Graduate']
educations.each do |i|
	Education.create( title: i, status_id: 1 )
end

# Experience
experience = ['None','Yes, 1-5 months', 'Yes, 6-11 months', 'Yes, 12-23 months', 'Yes, 24 months and above']
experience.each do |i|
	Experience.create( title: i, status_id: 1 )
end

# Source
source = ['Social Media', 'Online Job Portals', 'Email', 'School Events', 'Referral', 'Outdoor Advertising', 'Print Advertising']
source.each do |i|
	SourceInfo.create( title: i, status_id: 1 )
end












