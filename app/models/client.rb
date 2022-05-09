class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships

    def membership_id_array
        self.memberships.map do |membership|
            membership.gym_id
        end
    end
end
