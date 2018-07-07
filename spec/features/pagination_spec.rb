require 'rails_helper'

RSpec.describe 'Pagination test' do
  before(:each) do
    5.times do |n|
        User.create(email: "test#{n}@test.pl", password: '123123').tap do |user|
          5.times do |m|
            Question.create(user: user, title: "Question #{n}#{m}", content: 'Some very difficult problem description')
          end
        end
      end
  end

  scenario 'There are more than ten questions' do
    visit questions_path
    expect(page).to have_selector('.question-box', count: 10)
    expect(page).to have_content 'Next'
  end

  scenario 'Questions are in order from the newest' do
    visit questions_path
    expect(page.first(:css, '.question-box')).to have_content '44'
    expect(page.find_all(:css, '.question-box')[-1]).to have_content '30'
  end

end