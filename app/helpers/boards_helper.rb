module BoardsHelper

  def total_spent
	total_spent = []
    @board.images.each { |image| total_spent << image.image_price}
    @board.budget - total_spent.to_a.sum{ |e| e.to_i }
  end
  
  def total_style
     total_spent < 0 ? "style=color:red;" : "style=color:green;"
  end

  def to_currency(number)
    number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end

  def shared_link_gen
	[*('a'..'z'),*('A'..'Z'),*('0'..'9')].to_a.shuffle[0,8].join
  end

end