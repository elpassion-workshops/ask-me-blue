require 'rails_helper'

RSpec.describe 'Add new question' do
  context 'User is not log in' do  
    scenario "Try to find 'Ask question' button" do
        visit root_path
        expect(page).not_to have_content 'Ask question'
    end
  end

  context 'User is log in' do
    before(:each) do
        visit root_path
        click_link 'Log in'
        click_link 'Sign up'
        click_button 'Sign up'
        fill_in 'Email', with: 'test@test.test'
        fill_in 'Password', with: '123123'
        fill_in 'Password confirmation', with: '123123'
    
        click_button 'Sign up'
    end
    
    scenario "Try to find 'Ask question' button" do
        visit root_path
        expect(page).to have_content 'Ask question'

    end

    scenario "Try to visit add question form" do
        visit root_path
        click_link 'Ask question'

        expect(page).to have_content 'Title'
        expect(page).to have_content 'Content'
    end

    scenario 'Try to create new question' do
        visit new_question_path

        fill_in 'Title', with: 'Test tilte'
        fill_in 'Content', with: 'Test content??'
        click_button 'Ask question'

        expect(page).to have_text 'Question List'
    end
  end
end
  