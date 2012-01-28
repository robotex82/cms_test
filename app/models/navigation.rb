class Navigation < ActiveRecord::Base
  has_many :navigation_items, :dependent => :destroy
  
  validates :name, :presence => true, :uniqueness => true
end
