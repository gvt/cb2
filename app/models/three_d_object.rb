class ThreeDObject < ActiveRecord::Base
  has_attached_file :object
  validates_attachment_presence :object
  
  # create fake file for testing purposes
  # using StringIO is the trick for faking a file upload with Paperclip
  def fake_file!(filename = 'fake_file.txt')
    file = StringIO.new "#{self.class}.fake_file!()" # the file content
    file.original_filename = filename # using the Paperclip extentions here
    file.content_type      = "text/plain"    # using the Paperclip extentions here
    self.object = file
    self.save!
  end
  
  def filename
    File.basename(self.object.path, ".obj")
  end
end
