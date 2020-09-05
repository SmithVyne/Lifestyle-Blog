require 'rails_helper'

RSpec.describe Category, type: :feature do
  def log_in(user)
    visit new_session_path
    fill_in 'name', with: user.name
    click_on 'Login'
  end

  describe 'creating a category' do
    let(:user) { User.create( name: 'Smith' ) }
    let(:name) { "Modern art" }

    it 'validates entries' do
      log_in(user)
      click_on 'Create a Category'
      fill_in 'name', with: name
      choose('priority_3')
      click_on 'Save'
      expect(page).to have_content 'Home'
    end
  end
end
