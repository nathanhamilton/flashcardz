class DecksController < ApplicationController
  def index
    @decks = Deck.all
    respond_to do |format|
      format.html
      format.json { render json: @decks }
    end
  end
end
