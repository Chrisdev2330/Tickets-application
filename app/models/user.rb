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
class User < ApplicationRecord
  authenticates_with_sorcery!

  has_one :technical, dependent: :destroy

  has_one :customer, dependent: :destroy

  has_many :tickets, dependent: :destroy

  has_many :comments

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :username, presence: true

  enum rol: [:technical, :customer, :administrator]


end
