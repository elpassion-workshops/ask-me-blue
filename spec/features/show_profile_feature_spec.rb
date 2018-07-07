require 'rails_helper'

RSpec.describe 'Create new account' do



  # scenario 'User creates new account' do
  #   visit root_path
  #   click_link 'Log in'
  #   click_link 'Sign up'

  #   click_button 'Sign up'
  #   expect(page).to have_content 'Email can\'t be blank'
  #   expect(page).to have_content 'Password can\'t be blank'
  #   expect(current_path).not_to eq root_path

  #   fill_in 'Email', with: 'test@test.test'
  #   fill_in 'Password', with: '123123'
  #   fill_in 'Password confirmation', with: '123123'

  #   click_button 'Sign up'

  #   expect(current_path).to eq root_path
  #   expect(page).to have_content 'You have signed up successfully'
  # end
  before do
    visit root_path
    click_link 'Log in'
    click_link 'Sign up'

    click_button 'Sign up'

    fill_in 'Email', with: 'test@test.test'
    fill_in 'Password', with: '123123'
    fill_in 'Password confirmation', with: '123123'

    click_button 'Sign up'
  end

	it "shuld be possible to visit edit user page" do
		visit user_path
		expect(page.status_code).to eq(200)
   end

  describe "interaction" do
    it "should show parameters of current user" do
      visit user_path
      expect(page).to have_content "test@test.test"
      #expect(page).to have_content 
    end
  end
end