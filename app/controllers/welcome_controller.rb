class WelcomeController < ApplicationController
  def index
    @objects = ThreeDObject.find(:all)
  end

  def tutorial1; end
end
