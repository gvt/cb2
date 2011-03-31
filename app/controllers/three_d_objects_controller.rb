class ThreeDObjectsController < ApplicationController
  def new
    @object = ThreeDObject.new
  end
  
  def show
    @object = ThreeDObject.find(params[:id])
    object_name = File.basename(@object.object.path, ".obj")
    @object_js = "/system/objects/#{@object.id}/original/#{object_name}.js"
  end
  
  def create
    logger.debug("Here are the PARAMS: #{params[:object]}")
    @object = ThreeDObject.new(params[:object])
    if @object.save
      logger.debug("INFO: #{@object.attributes}")
      logger.debug("THE OBJECT ATTRIBUTES #{@object.object}")
      file_name = File.basename(@object.object.path, ".obj")
      `python public/3d/convert_obj_threejs_slim.py -i #{@object.object.path} -o public/system/objects/#{@object.id}/original/#{file_name}.js`
      redirect_to(three_d_object_path(@object), :notice => "Your object saved!")
    else
      redirect_to (new_three_d_object_path)
    end
  end

  def destroy
  end

end
