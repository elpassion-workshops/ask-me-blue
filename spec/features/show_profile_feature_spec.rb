require 'rails_helper'

RSpec.describe 'Profile show' do

  before do
    visit root_path
    click_link 'Log in'
    click_link 'Sign up'

    click_button 'Sign up'

    fill_in 'Email', with: 'test@test.test'
    fill_in 'Password', with: '123123'
    fill_in 'Password confirmation', with: '123123'

    click_button 'Sign up'
    user = User.first

    Question.create(title: "title1", user_id: user.id)
    Question.create(title: "title2", user_id: user.id)
  end

	it "shuld be possible to visit edit user page" do
		visit user_path
		expect(page.status_code).to eq(200)
   end

  describe "interaction" do
    it "should show user mail" do
      visit user_path
      expect(page).to have_content "test@test.test"
    end

    it "should show user questions" do

      visit user_path
      expect(page).to have_content "title1"
      expect(page).to have_content "title2"
    end
  end
end