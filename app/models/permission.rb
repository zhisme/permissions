class Permission < ApplicationRecord
  validates :action, uniqueness: { scope: :value }
  has_and_belongs_to_many :users
end
