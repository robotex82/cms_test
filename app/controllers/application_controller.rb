class ApplicationController < ActionController::Base
  include NavigationHelper
  
  protect_from_forgery
  
  before_filter :set_locale
  def set_locale
    I18n.locale = params[:i18n_locale]
  end
  
  def default_url_options(options={})
    { :i18n_locale => I18n.locale }
  end  
  
  def self.default_url_options(options={})
    { :i18n_locale => I18n.locale }
  end  
end
