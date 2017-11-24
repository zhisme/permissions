require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Initialize' do
    it 'creates with valid data' do
      user = build :user
      expect { user.save }.to change { User.count }.by(1)
    end

    it 'doesnt create with invalid data' do
      user = build :user, username: nil
      expect { user.save }.to change { User.count }.by(0)
    end
  end

  context 'can?' do
    it 'returns permission granted to user' do
      user = create :user
      permission = create :permission, value: false
      Permission.grant_permission({ action: permission.action, value: permission.value }, user)
      expect(user.can?(permission.action)).to eq(false)
    end
  end
end
