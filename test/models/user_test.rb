# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  username         :string           not null
#  email            :string
#  crypted_password :string
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  rol              :integer
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
