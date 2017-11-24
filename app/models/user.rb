class User < ApplicationRecord
  include CheckPermission
  validates :email, uniqueness: true, on: :create
  validates :username, uniqueness: true, on: :create
  validates :email, presence: true, on: :create
  validates :username, presence: true, on: :create

  has_and_belongs_to_many :permissions
  has_many :roles

  def can?(action)
    permission = _can?(action)
    return permission unless permission.nil?

    roles.find do |r|
      return r._can?(action)
    end
  end
end
