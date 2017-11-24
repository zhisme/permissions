class PermissionSerializer < ActiveModel::Serializer
  attributes :id,
             :action,
             :value
end
