class SectionGroup < ApplicationRecord
    belongs_to :user
    belongs_to :starting_place, class_name: 'Place'
    belongs_to :ending_place, class_name: 'Place'

    has_many :memberships, dependent: :destroy
    has_many :users, through: :memberships
  end
  