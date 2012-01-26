ActiveAdmin.register Folder do
  index do
    column :fullname
    column :templates_count
    default_actions
  end
  
  form do |f|
    f.inputs do
      f.input :parent
      f.input :basename
    end  

    f.buttons
  end
end
