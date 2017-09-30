# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# if Rails.env.development?

	#Acaopamento
	ApiUser.create!(id:1, email: 'admin@example.com', password: 'password', password_confirmation: 'password', api_name: 'Acaopamento', user_is_element: false) 

	User.create!(id:1, api_user_id:1, email: 'rocali@outlook.com',password: 'password')
	UserInfo.create!(user_id: 1, name: 'Lucas Rocali')

	
# end