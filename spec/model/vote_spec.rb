require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
  end

  it 'user cannot vote an article more than once' do
    should validate_uniqueness_of(:user_id).scoped_to(:article_id)
  end
end
