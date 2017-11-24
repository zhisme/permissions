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
end
