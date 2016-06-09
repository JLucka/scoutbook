ActiveAdmin.register Scout do
  permit_params :first_name, :last_name, :pesel, :address, :mothers_name, :fathers_name,
                :rank, :position, :patrol_id

end
