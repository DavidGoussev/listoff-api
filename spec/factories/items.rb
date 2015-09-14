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

FactoryGirl.define do
  factory :item do
    name "test to-do entry"
    user
  end

end
