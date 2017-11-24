class Role < ApplicationRecord
  include CheckPermission

  validates :name, presence: true, on: :create

  has_and_belongs_to_many :permissions
  belongs_to :user

  def can?(action)
    permissions.find_by(action: action).try(:value)
  end

  def to_hash
    {
      entity: {
        id: id,
        type: self.class.name
      }
    }
  end
end
