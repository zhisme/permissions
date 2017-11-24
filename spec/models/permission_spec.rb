require 'rails_helper'

RSpec.describe Permission, type: :model do
  context 'Initialize' do
    it 'creates with valid data' do
      perm = build :permission
      expect { perm.save }.to change { Permission.count }.by(1)
    end

    it 'doesnt create with invalid data' do
      origin = create :permission, action: "Open file 'C://1.txt'"
      perm = build :permission, action: origin.action
      expect { perm.save }.to change { Permission.count }.by(0)
    end
  end

  context 'grant permission' do
    it 'presented with success' do
      user = create :user
      permission = create :permission
      Permission.grant_permission({ action: permission.action, value: true }, user)
      expect(user.permissions.size).to eq(1)
    end

    it 'new with success' do
      user = create :user
      permission = build :permission
      Permission.grant_permission({ action: permission.action, value: true }, user)
      expect(user.permissions.size).to eq(1)
    end

    it 'nothing added' do
      user = create :user
      permission = create :permission
      user.permissions << permission
      Permission.grant_permission({ action: permission.action, value: true }, user)
      expect(user.permissions.reload.size).to eq(1)
    end
  end
end
