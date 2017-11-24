class User < ApplicationRecord
  validates :email, uniqueness: true, on: :create
  validates :username, uniqueness: true, on: :create
  validates :email, presence: true, on: :create
  validates :username, presence: true, on: :create

  has_and_belongs_to_many :permissions

  def can?(action)
    permissions.find_by(action: action).try(:value)
  end
end
