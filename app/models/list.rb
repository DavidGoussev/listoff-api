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

class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  #validates_inclusion_of :permissions, in: %w(private viewable open), :on => :update, :message => "value %s is invalid!"

  validate :validate_permissions, :on => :update

  default_scope { order(created_at: :asc) }

  def editable?
    ["private",  "viewable", "open"].include?(self.permissions)
  end


  private

  def validate_permissions
    if !editable?
      errors.add(:base, "Permission to update denied!")
    end
  end

  def validate_editable
     if !editable?
      errors.add(:base, "entry not editable!")
    end
  end



end
