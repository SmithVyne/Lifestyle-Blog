require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Associations' do
    it { should have_many(:articles) }
    it { should have_many(:articles_categories) }
  end

  context 'Validations' do
    let(:category) { Category.new(name: 'Modern Art', priority: 2) }

    it 'invalid without a name' do
      category.name = nil
      expect(category).to_not be_valid
    end

    it 'invalid without a priority' do
      category.priority = nil
      expect(category).to_not be_valid
    end

    it 'invalid for category name with more than 30 characters' do
      category.name = (0...31).map { ('a'..'z') }.join
      expect(category).to_not be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:priority) }
  end
end
