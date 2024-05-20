class User < ApplicationRecord
    has_many :itineraries, dependent: :destroy
    has_many :section_groups, dependent: :destroy
  
  end
  