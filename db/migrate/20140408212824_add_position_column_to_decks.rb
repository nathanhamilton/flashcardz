class AddPositionColumnToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :position, :integer
  end
end
