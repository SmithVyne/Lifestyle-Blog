require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Associations' do
    it { should have_many(:votes) }
    it { should have_many(:categories) }
    it { should have_many(:articles_categories) }
    it { should belong_to(:author) }
  end

  context 'Validations' do
    let(:user) { User.create(name: 'joue') }
    let(:article) { user.articles.build(title: 'Test Title', text: 'This is a new test article') }

    it 'invalid without an image' do
      expect(article).to_not be_valid
    end

    it 'invalid for article title with more than 50 characters' do
      article.title = (0...51).map { ('a'..'z') }.join
      expect(article).to_not be_valid
    end

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:image) }
  end
end
