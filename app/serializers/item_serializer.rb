# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  list_id    :integer
#

class ItemSerializer < ActiveModel::Serializer
  attributes :id, :item, :created_at

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

end
