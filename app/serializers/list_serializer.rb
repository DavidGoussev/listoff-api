class ListSerializer < ActiveModel::Serializer
  attributes :id, :list_title, :created_at

  def list_title
    object.title
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

end
