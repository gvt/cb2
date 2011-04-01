class ThreeDObjectsController < ApplicationController
  def new
    @object = ThreeDObject.new
  end
  
  def show
    @object = ThreeDObject.find(params[:id])
    @object_js = "/system/objects/#{@object.id}/original/#{@object.filename}.js"
  end
  
  def create
    @object = ThreeDObject.new(params[:object])
    if @object.save
      convert = %x[python public/3d/convert_obj_threejs_slim.py -i #{@object.object.path} -o public/system/objects/#{@object.id}/original/#{@object.filename}.js >/dev/null; echo $?;]
      if convert.to_i == 0
        redirect_to(three_d_object_path(@object), :notice => "Your object saved!")
      else
         redirect_to(new_three_d_object_path, :error => "Something is wrong with your .obj file")
      end
    else
      redirect_to(new_three_d_object_path, :error => @object.errors.full_messages.to_sentence)
    end
  end

  def destroy
  end

end
