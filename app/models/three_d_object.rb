class ThreeDObject < ActiveRecord::Base
  has_attached_file :object
  validates_attachment_presence :object
end
