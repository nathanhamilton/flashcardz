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
    @deck_positions = params[:deck]
    @decks = Deck.all
    assign_positions(@deck_positions, @decks)
  end

  private

  def assign_positions(deck_positions, decks)
    decks.each do |deck|
      deck_positions.each do |number|
        deck.position = number
      end
    end
  end
end
