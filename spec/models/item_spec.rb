# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Item do

    describe "create" do

      before do
        @user2 = create(:user)
        2.times { create(:item, user: @user2) }
      end

      it "stores to-do item count on user2" do
        expect( @user2.items.count ).to eq(2)
      end


  end
end
