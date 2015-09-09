class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :full_name, :password, :created_at

  def full_name
    object.name
  end



  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

end
