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
end
