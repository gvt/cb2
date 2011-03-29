class ThreeDObjectsController < ApplicationController
  def new

  end

  def create
    @object = ThreeDObject.create(params[:object])
  end

  def destroy
  end

end
