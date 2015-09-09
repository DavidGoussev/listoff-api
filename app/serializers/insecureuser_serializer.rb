class InsecureUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :full_name, :password

  def full_name
    object.name
  end


end
