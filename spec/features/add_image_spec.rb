require 'rails_helper'

describe "the add image process" do
  it 'adds an image to an album' do
    album = FactoryGirl.create(:album)
    login_as(album.user, :scope => :user)
    visit '/'
    click_link "My Profile"
    click_link album.name
    attach_file('image_picture', 'spec/support/IMG_4786.jpg')
    click_button "Add Image"
    expect(page).to have_content("Image added")
  end
end
