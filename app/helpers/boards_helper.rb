module BoardsHelper

	def total_spent
	  total_spent = []
      @board.images.each { |image| total_spent << image.image_price}
      @board.budget - total_spent.to_a.sum{ |e| e.to_i }
    end
end