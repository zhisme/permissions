module GrantPermission
  extend ActiveSupport::Concern

  included do
    def self.grant_permission(hash, entity)
      if action_persist?(hash)
        permission = find_permission(hash)
      else
        permission = insert_action(hash)
      end
      return false if already_has_permission?(entity, permission)
      entity.permissions << permission
      permission
    end

    def self.insert_action(hash)
      Permission.create!(hash)
    end

    def self.action_persist?(hash)
      Permission.new(hash).invalid?
    end

    def self.find_permission(hash)
      Permission.find_by(hash)
    end

    def self.already_has_permission?(entity, permission)
      entity.permissions.include?(permission)
    end

    class << self
      private :insert_action, :action_persist?, :find_permission,
              :already_has_permission?
    end

  end
end
