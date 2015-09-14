# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  title       :string
#  permissions :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class ListSerializer < ActiveModel::Serializer
  attributes :id, :list_title, :created_at

  def list_title
    object.title
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

end
