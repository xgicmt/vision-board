class WelcomeController < ApplicationController
  def index
   @imageL = Image.where(landscape: true).order("RANDOM()").first(2)
   @imageP = Image.where(landscape: nil).order("RANDOM()").first(2)
  end

  def about
  end
end
