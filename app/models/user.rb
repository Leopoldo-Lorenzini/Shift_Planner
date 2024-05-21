class User < ApplicationRecord
    has_secure_password
    has_many :itineraries, dependent: :destroy
    has_many :section_groups, dependent: :destroy

    has_many :memberships, dependent: :destroy
    has_many :section_group, through: :memberships

    validates :email, presence: true, uniqueness: true
end

