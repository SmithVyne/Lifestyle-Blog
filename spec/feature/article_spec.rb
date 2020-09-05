require 'rails_helper'

RSpec.feature Article, type: :feature do
  let!(:user) { User.create(name: 'juxoe') }
  def log_in(user)
    visit new_session_path
    fill_in 'name', with: user.name
    click_on 'Login'
  end

  describe 'creating a new article' do
    let!(:category) { Category.create(name: 'Modern art', priority: 2) }

    it 'should pass' do
      log_in(user)

      click_on 'Write an Article'
      fill_in 'title', with: 'Test title'
      fill_in 'text', with: 'Test article body'
      page.attach_file('image', "#{Rails.root}/docs/test_img.jpg")
      select(category.name, from: 'category_id')
      click_on 'Save'
      expect(page).to have_content 'Article successfully created'
    end

    it 'should fail without an image' do
      log_in(user)

      click_on 'Write an Article'
      fill_in 'title', with: 'Test title'
      fill_in 'text', with: 'Test article body'
      select(category.name, from: 'category_id')
      click_on 'Save'
      expect(page).to have_content 'Image can\'t be blank'
    end

    it 'should fail without a title and body' do
      log_in(user)

      click_on 'Write an Article'
      page.attach_file('image', "#{Rails.root}/docs/test_img.jpg")
      select(category.name, from: 'category_id')
      click_on 'Save'
      expect(page).to have_content 'Title can\'t be blank'
    end
  end
end
