ActiveAdmin.register UserInfo do
permit_params :user_id, :name

form do |f|
  f.inputs do
    f.input :user_id, :label => 'User', :as => :select, :collection => User.all.map{|u| ["#{u.email}", u.id]}
    f.input :name
  end
  f.actions
end
end
