ActiveAdmin.register Template do
  scope :views
  scope :partials
  
  form do |f|
    f.inputs do
      f.input :folder
      f.input :name      
      f.input :body
      f.input :locale,  :as => :select, :collection => I18n.available_locales.map(&:to_s)
      f.input :format,  :as => :select, :collection => Mime::SET.symbols.map(&:to_s)
      f.input :handler, :as => :select, :collection => ActionView::Template::Handlers.extensions.map(&:to_s)
    end  

    f.buttons
  end
  
  index do
    column :path
    column :locale
    column :format
    column :handler
    default_actions
  end
end
