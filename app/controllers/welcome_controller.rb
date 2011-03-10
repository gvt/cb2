class WelcomeController < ApplicationController
  def index
    obj_file_path = File.join(Rails.root.to_s, 'tmp', '3d.obj')
    obj_file      = File.open(obj_file_path)
    @obj_content  = obj_file.read.gsub(" \r", "").gsub("\r", " ").gsub("  ", " ")
  end
end
