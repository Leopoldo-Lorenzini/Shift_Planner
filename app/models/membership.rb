class Membership < ApplicationRecord
    belongs_to :user
    belongs_to :section_group
end
