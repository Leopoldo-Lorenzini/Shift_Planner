class Itinerary < ApplicationRecord
    belongs_to :starting_place,     class_name: 'Place'
    belongs_to :ending_itineraries, class_name: 'Place'
    belongs_to :user
end
