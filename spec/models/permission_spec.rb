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
end
