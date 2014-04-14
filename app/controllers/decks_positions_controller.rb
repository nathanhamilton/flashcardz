class DecksPositionsController < ApplicationController

  def update
    assign_positions(params[:deck])
    render nothing: true, status: 204
  end

  private

  def assign_positions(deck_ids)
    deck_ids.each_with_index do |deck_id, index|
      Deck.find(deck_id).update(position: index)
    end
  end
end
