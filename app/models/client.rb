class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships

    def membership_id_array
        self.memberships.map do |membership|
            membership.gym_id
        end
    end

    def total
        charges = self.memberships.map do |membership|
            membership.charge
        end
        charges.sum
    end
end
