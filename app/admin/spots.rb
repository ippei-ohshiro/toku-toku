ActiveAdmin.register Spot do
  permit_params :name, :address, :description, :image
  
#   form do |f|
#     f.inputs do
#       f.input :name
#       f.input :address
#       f.input :description
#       f.input :image, as: :file, input_html: { multiple: true }
#     end
#     f.actions
#   end

form do |f|
  f.inputs do
    f.input :name
    f.input :address
    f.input :description
    f.input :image, as: :file
    f.actions
  end
end
  
  show do
    attributes_table do
      row :name
      row :address 
      row :description
      row :image do |ad|
        image_tag url_for(ad.image),:size =>'500x300'
      end
    end
  end
end