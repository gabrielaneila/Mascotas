class Publication < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "300x300>" }
end
