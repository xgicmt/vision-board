class WelcomeController < ApplicationController
  def index
    @imageL = Image.where(landscape: true).order("RANDOM()").first(2)
    @imageP = Image.where(landscape: nil).order("RANDOM()").first(2)
    @shared_board_id = Board.all.sample.shared_link
  end

  def about
  end
end
