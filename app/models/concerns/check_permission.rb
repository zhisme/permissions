module CheckPermission
  extend ActiveSupport::Concern

  included do
    def _can?(action)
      permissions.find_by(action: action).try(:value)
    end
  end
end
