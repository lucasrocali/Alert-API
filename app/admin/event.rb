ActiveAdmin.register Event do

permit_params :location_id, :category_id, :importance, :comment

end
