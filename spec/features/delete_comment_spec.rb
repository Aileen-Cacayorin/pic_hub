describe "delete comment path" do
  it 'deletes a comment to the image page' do
    album = FactoryGirl.create(:album)
    login_as(album.user, :scope => :user)
    visit '/'
    click_link 'My Profile'
    click_link "Cambodia"
    attach_file('image_picture', 'spec/support/IMG_4786.jpg')
    click_button "Add Image"
    click_link ("Img 4786")
    fill_in "Body", :with => "Nice pic"
    click_button "Create Comment"
    click_link "Delete"
    expect(page).to_not have_content('Nice pic')
  end

end
