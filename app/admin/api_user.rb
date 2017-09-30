ActiveAdmin.register ApiUser do
  permit_params :api_name, :email, :password, :password_confirmation, :user_is_element

  index do
    selectable_column
    id_column
    column :api_name
    column :api_token
    column :email
    column :user_is_element
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :api_name
  filter :api_token
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :api_name
      f.input :user_is_element
    end
    f.actions
  end

end
