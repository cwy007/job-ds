class WelcomeController < ApplicationController
  def index
    flash[:alert] = "say hi"
    flash[:notice] = "say hi"
    flash[:warning] = "say hi"
  end
end
