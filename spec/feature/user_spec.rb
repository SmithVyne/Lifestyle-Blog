require 'rails_helper'

RSpec.feature User, type: :feature do
  let!(:user) { User.create( name: 'juxoe' ) }
  def log_in(user)
    visit new_session_path
    fill_in 'name', with: user.name
    click_on 'Login'
  end

  describe 'creating a user session' do
    it 'should pass' do
      log_in(user)
      expect(page).to have_content 'Home'
    end

    it 'should fail' do
      user.name = nil
      log_in(user)
      expect(page).to_not have_content 'Home'
    end
  end

  describe 'Logging out a user session' do
    it 'should pass' do
      log_in(user)
      click_on 'LOGOUT'
      expect(page).to have_content 'Login'
    end
  end

  describe 'Creating a new user' do

    it 'should pass' do
      visit new_user_path
      fill_in 'name', with: 'West Smith'
      click_on 'Sign up'
      expect(page).to have_content 'Home'
    end

    it 'should fail' do
      visit new_user_path
      fill_in 'name', with: ''
      click_on 'Sign up'
      expect(page).to_not have_content 'Home'
    end
  end
end
