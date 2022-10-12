# == Schema Information
#
# Table name: technicals
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
class Technical < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy
end
