class WelcomeController < ApplicationController
  def index
    @objects = ThreeDObject.find(:all)
    logger.debug("#{@objects.first.object.path}")
  end

  def tutorial1; end
end
