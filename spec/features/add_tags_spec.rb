require 'rails_helper'

describe "show image path" do
  it 'goes to the image page' do
    album = FactoryGirl.create(:album)
    login_as(album.user, :scope => :user)
    visit '/'
    click_link 'My Profile'
    click_link "Cambodia"
    attach_file('image_picture', 'spec/support/IMG_4786.jpg')
    click_button "Add Image"
    click_link ("Img 4786")
    find('#tag_user_id').find(:xpath, 'option[1]').select_option
    click_button "Tag"
    expect(page).to have_content("Tag added")
  end
end
