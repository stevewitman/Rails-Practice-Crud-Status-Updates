require 'rails_helper'

feature "Status Updates (messages)" do

  scenario "users can make, edit anddelete status updates" do
    visit '/messages'
    # create a new status update
    click_on "New Status Update"
    expect(page).to have_content("Update Status")
    fill_in "User", with: "TestUser"
    fill_in "Status", with: "TestStatus"
    fill_in "Likes", with: 4
    click_on "Create Message"
    expect(page).to have_content("Status update successfully created.")
    expect(page).to have_content("User: TestUser")
    expect(page).to have_content("Status: TestStatus")
    expect(page).to have_content("Likes: 4")
    # edit a status update
    click_on "Edit"
    expect(page).to have_content("Edit Update Status")
    fill_in "User", with: "TestUser2"
    fill_in "Status", with: "TestStatus2"
    fill_in "Likes", with: 5
    click_on "Update Message"
    expect(page).to have_content("Status update successfully updated.")
    expect(page).to have_content("User: TestUser2")
    expect(page).to have_content("Status: TestStatus2")
    expect(page).to have_content("Likes: 5")
    # delete a status update
    click_on "Delete"
    expect(page).to have_content("Status update successfully deleted.")
    expect(page).to have_no_content("User: TestUser2")
    expect(page).to have_no_content("Status: TestStatus2")
    expect(page).to have_no_content("Likes: 5")
  end

end
