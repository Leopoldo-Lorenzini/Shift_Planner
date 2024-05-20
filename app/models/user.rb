class User < ApplicationRecord
    has_secure_password
    has_many :itineraries, dependent: :destroy
    has_many :section_groups, dependent: :destroy

    validates :email, presence: true, uniqueness: true

    
  end
  