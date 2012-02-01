ActiveAdmin.register NavigationItem do
  form do |f|
    f.inputs do
      f.input :navigation
      f.input :parent
      f.input :key
      f.input :name,:as => :flexible_text
      f.input :url, :as => :string
      f.input :options
    end  

    f.buttons
  end
end
