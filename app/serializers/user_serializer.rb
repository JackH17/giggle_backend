class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :my_groups

  def my_groups
    self.object.groups
  end 




end
