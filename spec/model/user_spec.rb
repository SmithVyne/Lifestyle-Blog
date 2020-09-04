require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Smith') }

  context 'Associations' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
  end

  context 'Validations' do
    it 'is valid with valid name' do
      user.name = 'John Okoro'
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it { should validate_length_of(:name).is_at_most(30) }
    it { should validate_presence_of(:name) }
  end
end
