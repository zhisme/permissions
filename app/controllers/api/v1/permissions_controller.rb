class Api::V1::PermissionsController < Api::V1::BaseController
  before_action :check_entity_type, :set_entity

  def is_action_permitted
    permission = @entity.permissions.find_by(action: permission_params[:action])
    if permission.present?
      render json: permission, status: 200
    else
      render json: permission, status: 404
    end
  end

  def create
    hash = format_hash
    permission = Permission.grant_permission(hash, @entity)
    if permission.present?
      render json: permission, status: 201
    else
      render json: { errors: ["#{@entity.class.name} already has this permission."] }, status: 422
    end
  end

  private

  def check_entity_type
    head 400 unless %w[Role User].include? entity_params[:type]
  end

  def set_entity
    @entity = entity_params[:type].constantize.find_by_id(entity_params[:id])
    head 404 unless @entity.present?
  end

  def format_hash
    permission_params.merge!(value: permission_params['value'] == 'true')
  end

  def permission_params
    params.require(:permission).permit(:action, :value)
  end

  def entity_params
    params.require(:entity).permit(:id, :type)
  end
end
