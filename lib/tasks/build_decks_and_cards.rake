namespace :db do
  desc "This task builds the cards and decks for the applications"
  task build_decks_and_cards: :environment do
    decks = [
      'Ingenious',
      'Smart',
      'Studious',
      'IQ',
      'Proficient'
    ]

    card_type = [
      'King',
      'Queen',
      'Jack',
      '10',
      '9',
      '8',
      '7',
      '6',
      '5',
      '4',
      '3',
      '2',
      'Ace'
    ]

    card_suit = [
      'Black Spade',
      'Red Diamond',
      'Black Club',
      'Red Heart'
    ]

    Deck.delete_all
    Card.delete_all

    puts "Starting the process of creating your decks and cards"

    decks.each do |name|
      Deck.create name: name
      card_type.each do |type|
        card_suit.each do |suit|
          Card.create content: type + " " + suit, deck_id: Deck.last.id
        end
      end
    end
    puts "Creation was successful. Congratulations!"
  end
end
