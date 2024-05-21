class Itinerary < ApplicationRecord
    belongs_to :user
    belongs_to :starting_place, class_name: 'Place'
    belongs_to :ending_place, class_name: 'Place'

  end
  