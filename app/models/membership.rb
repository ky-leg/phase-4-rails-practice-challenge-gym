class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client
    validates :gym_id, presence: true 
    validates :client_id, presence: true
    validates :charge, presence: true
    validate :client_has_only_one_membership_with_gym
    
    def client_has_only_one_membership_with_gym
        
        client = Client.find(client_id)
        id_array = client.membership_id_array
        if id_array.include? client_id
            errors.add(:gym_id, "this client has already registered with this gym")
        end
    end
end
