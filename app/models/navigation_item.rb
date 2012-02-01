class NavigationItem < ActiveRecord::Base
  belongs_to :navigation
  
  acts_as_nested_set
  attr_protected :lft, :rgt
  
  translates :name, :url
  
  validates :name, :presence => true
  validates :url, :presence => true
  validates :key, :presence => true
end
