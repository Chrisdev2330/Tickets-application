# == Schema Information
#
# Table name: tickets
#
#  id           :bigint           not null, primary key
#  problem      :string           not null
#  description  :text             not null
#  case         :integer          not null
#  level        :integer          not null
#  status       :integer          default("open")
#  building_id  :bigint           not null
#  user_id      :bigint           not null
#  technical_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :building
  belongs_to :technical
  has_many :comments

 

  enum case: [:infra, :equipment, :system]

  enum status: [:open, :closed, :attended]
end
