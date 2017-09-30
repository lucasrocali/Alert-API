ActiveAdmin.register User do

permit_params :api_user_id, :email, :password_digest

end
