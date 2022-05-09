class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_gym_charges

  def total_gym_charges
    self.object.total
  end
end
