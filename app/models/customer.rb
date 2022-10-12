# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  lastname   :string           not null
#  phone      :string           not null
#  address    :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Customer < ApplicationRecord
  belongs_to :user
end
