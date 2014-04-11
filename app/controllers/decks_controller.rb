class DecksController < ApplicationController
  def index
    @decks = Deck.all
    respond_to do |format|
      format.html
      format.json { render json: @decks }
    end
  end

  def show
    @cards = Card.where(deck_id: params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @cards }
    end
  end

  def create
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
