class Permission < ApplicationRecord
  include GrantPermission

  validates :action, uniqueness: { scope: :value }
  has_and_belongs_to_many :users

  def to_hash
    {
      permission: {
        id: id,
        value: value,
        action: action
      }
    }
  end
end
