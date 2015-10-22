require 'rails_helper'

describe "the add album process" do
  it 'adds an album' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit '/'
    click_link "Create Album"
    fill_in 'Name', with: "Vacation"
    fill_in 'Description', with: "Best trip ever"

    click_button "Create Album"
    expect(page).to have_content "Vacation"
  end
end
