require 'rails_helper'

PERMISSION_KEYS = %w[id action value].freeze

RSpec.describe Api::V1::PermissionsController, type: :controller do
  describe '#GET is_action_permitted' do
    describe 'success' do
      it 'returns found permission for user' do
        entity = create :user
        permission = create :permission
        Permission.grant_permission({ action: permission.action, value: permission.value }, entity)
        params = {}.merge!(entity.to_hash).merge!(permission.to_hash)
        get :is_action_permitted, params: params
        expect(response.status).to eq(200)
      end

      it 'returns with exact serialized keys' do
        entity = create :user
        permission = create :permission
        Permission.grant_permission({ action: permission.action, value: permission.value }, entity)
        params = {}.merge!(entity.to_hash).merge!(permission.to_hash)
        get :is_action_permitted, params: params
        expect(response.status).to eq(200)
        expect(response_body.keys).to eq PERMISSION_KEYS
      end
    end

    describe 'failure' do
      it 'if wrong entity type' do
        entity = create :user
        permission = create :permission
        Permission.grant_permission({ action: permission.action, value: permission.value }, entity)
        params = {}.merge!(entity.to_hash).merge!(permission.to_hash)
        params[:entity][:type] = 'wrong'
        get :is_action_permitted, params: params
        expect(response.status).to eq(400)
      end

      it 'if entity doesnt exist' do
        entity = create :user
        permission = create :permission
        Permission.grant_permission({ action: permission.action, value: permission.value }, entity)
        params = {}.merge!(entity.to_hash).merge!(permission.to_hash)
        params[:entity][:id] = entity.id + 1
        get :is_action_permitted, params: params
        expect(response.status).to eq(404)
      end

      it 'if permission not found' do
        entity = create :user
        permission = create :permission
        Permission.grant_permission({ action: permission.action, value: permission.value }, entity)
        params = {}.merge!(entity.to_hash).merge!(permission.to_hash)
        params[:permission][:action] = 'random123124'
        get :is_action_permitted, params: params
        expect(response.status).to eq(404)
      end
    end
  end

  describe '#POST create' do
    context 'success' do
      it 'for user' do
        entity = create :user
        permission = build :permission
        params = {}.merge!(entity.to_hash).merge!(permission.to_hash)
        post :create, params: params
        expect(response.status).to eq(201)
      end

      it 'for role' do
        user = create :user
        entity = create :role, user: user
        permission = build :permission
        params = {}.merge!(entity.to_hash).merge!(permission.to_hash)
        post :create, params: params
        expect(response.status).to eq(201)
      end

      it 'returns with exact serialized keys' do
        user = create :user
        entity = create :role, user: user
        permission = build :permission
        params = {}.merge!(entity.to_hash).merge!(permission.to_hash)
        post :create, params: params
        expect(response_body.keys).to eq PERMISSION_KEYS
      end
    end

    context 'failure' do
      it 'if user permission already presented' do
        entity = create :user
        permission = create :permission
        Permission.grant_permission({ action: permission.action, value: permission.value }, entity)
        params = {}.merge!(entity.to_hash).merge!(permission.to_hash)
        post :create, params: params
        expect(response.status).to eq(422)
      end

      it 'if role permission already presented' do
        user = create :user
        entity = create :role, user: user
        permission = create :permission
        Permission.grant_permission({ action: permission.action, value: permission.value }, entity)
        params = {}.merge!(entity.to_hash).merge!(permission.to_hash)
        post :create, params: params
        expect(response.status).to eq(422)
        expect(response.body['errors']).to_not be_empty
      end
    end
  end
end
