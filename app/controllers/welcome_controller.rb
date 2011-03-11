class WelcomeController < ApplicationController
  def index
    obj_file_path = File.join(Rails.root.to_s, 'tmp', 'teapot 2.obj')
    obj_file      = File.open(obj_file_path)
    @obj_content  = obj_file.read.gsub(" \r", " ").gsub("\r", " ").gsub("  ", " ")
    render :layout => 'obj_viewer'
  end

  def tutorial1; end
end
