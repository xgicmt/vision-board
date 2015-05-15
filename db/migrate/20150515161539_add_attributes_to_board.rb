class AddAttributesToBoard < ActiveRecord::Migration
  def change
  	add_column :boards, :budget, :integer
  	add_column :boards, :shared_link, :string
  end
end
