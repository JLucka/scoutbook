ActiveAdmin.register Troop do
  permit_params :name, :full_name, :number, :patron, :district, :region
end
