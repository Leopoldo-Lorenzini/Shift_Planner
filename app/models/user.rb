class User < ApplicationRecord
    has_many :itineraries, dependent: :destroy
end
