# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# if Rails.env.development?

	####### Disaster Alert ####### 
	apiDisasterUser = ApiUser.create!(email: 'disaster@example.com', password: 'password', password_confirmation: 'password', api_name: 'Disaster Alert') 
	
	# User.create!(id:1, api_user_id:1, email: 'rocali@outlook.com',password: 'password')
	# UserInfo.create!(user_id: 1, name: 'Lucas Rocali')

	20.times { 
		user = FactoryGirl.create(:user, api_user_id: apiDisasterUser.id) 

		10.times { 
			FactoryGirl.create(:location, user_id: user.id) 
		}
	}

	Category.create!(api_user_id: apiDisasterUser.id, name:"Incendio")
	Category.create!(api_user_id: apiDisasterUser.id, name:"Alagamento")
	Category.create!(api_user_id: apiDisasterUser.id, name:"Chuva forte")

	Tag.create!(api_user_id: apiDisasterUser.id, name:"SJC")
	Tag.create!(api_user_id: apiDisasterUser.id, name:"SP")
	Tag.create!(api_user_id: apiDisasterUser.id, name:"Jacarei")


	####### Price Alert ####### 
	apiAlertUser = ApiUser.create!(email: 'price@example.com', password: 'password', password_confirmation: 'password', api_name: 'Price Alert') 

	10.times { 
		user = FactoryGirl.create(:user, api_user_id: apiAlertUser.id) 

		20.times { 
			FactoryGirl.create(:location, user_id: user.id) 
		}
	}

	Category.create!(api_user_id: apiAlertUser.id, name:"Cerveja")
	Category.create!(api_user_id: apiAlertUser.id, name:"Cerveja Importada")


	
# end