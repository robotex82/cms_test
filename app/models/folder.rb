class Folder < ActiveRecord::Base
  validates :basename, :uniqueness => { :scope => :parent_id }
  has_many :templates
  
  default_scope :order => "path ASC, basename ASC"
  
  acts_as_nested_set
  attr_protected :lft, :rgt
  
  before_validation :update_path
  after_save :update_children_paths, :if => Proc.new { |folder| folder.path_changed? }
  after_save :update_templates, :if => Proc.new { |folder| folder.path_changed? }

  def to_s
    self.fullname
  end  
 
  def fullname
    if self.basename == "/"
      "/"
    else
      "#{self.path}#{self.basename}/"
    end
  end
  
  def update_path
    if self.parent
      self.path = parent.fullname
    end
  end
  
  def update_path!
    self.update_path
    self.save
  end 
  
  def update_children_paths
    if self.path_changed?
      self.children.each do |child|
        child.update_path!
      end
    end  
  end  
    
  def update_templates
    self.templates.each do |template|
      template.save
    end  
  end     
end
