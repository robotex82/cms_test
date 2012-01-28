class NavigationItem < ActiveRecord::Base
  belongs_to :navigation
  
  acts_as_nested_set
  attr_protected :lft, :rgt
end
