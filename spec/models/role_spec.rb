require 'rails_helper'

RSpec.describe Permission, type: :model do
  context 'Initialize' do
    it 'creates with valid data' do
      user = create :user
      role = build :role, user: user
      expect { role.save }.to change { Role.count }.by(1)
    end
  end

  context 'can?' do
    it 'return role permission if user permission is not set' do
      user = create :user
      role = create :role, user: user
      perm = create :permission
      Permission.grant_permission({ action: perm.action, value: true }, role)
      expect(user.can?(perm.action)).to eq(true)
    end

    it 'returns user permission ignoring role permission' do
      user = create :user
      role = create :role, user: user
      perm = create :permission
      Permission.grant_permission({ action: perm.action, value: false }, role)
      Permission.grant_permission({ action: perm.action, value: true }, user)
      expect(user.can?(perm.action)).to eq(true)
    end
  end
end
