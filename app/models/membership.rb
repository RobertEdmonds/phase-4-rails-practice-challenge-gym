class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :gym_id, presence: true 
  validates :client_id, presence: true 
  validates :charge, presence: true 
  validate :only_one_charge_gym 

  def only_one_charge_gym
    check = Membership.find_by(client_id: client_id, gym_id: gym_id)
    if check
      errors.add(:gym_id, "Can Not Have Multiple Accouts With Same Gym")
    end
  end
end
