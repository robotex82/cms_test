class PageController < ApplicationController
  #include ActionController::Rendering
  #include AbstractController::Helpers

  append_view_path Template::Resolver.instance
  #helper CmsHelper
  
  def respond
    @page = params[:page]
    render :template => @page
  end
end    
