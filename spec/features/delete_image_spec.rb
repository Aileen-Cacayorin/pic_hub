# require 'rails_helper'
#
# describe "the delete image process" do
#
#   it 'deletes an image from an album' do
#     user = FactoryGirl.create(:user)
#     login_as(user, :scope => :user)
#     visit '/'
#     click_link "Create Album"
#     fill_in 'Name', with: "Vacation"
#     fill_in 'Description', with: "Best trip ever"
#     click_button "Create Album"
#     click_link "Vacation"
#     attach_file('image_picture', 'spec/support/IMG_4786.jpg')
#     click_button "Add Image"
#
#     find(:css, ".glyphicon.glyphicon-trash").click
#     expect(page).to have_content("Image gone forever!")
#   end
# end
