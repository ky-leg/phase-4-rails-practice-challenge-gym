class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client
    validates :gym_id, presence: true 
    validates :client_id, presnece: true
    validates :charge, presence: true
end
