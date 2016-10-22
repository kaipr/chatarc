require "rails_helper"

feature "Add conversation", type: :feature do
  scenario "go to add conversation from root" do
    visit root_path

    click_link "Add Conversation"

    expect(current_path).to eq new_conversation_path
  end

  scenario "add a conversation" do
    visit new_conversation_path

    fill_form :conversation,
              title: "A cool conversation",
              note: "This is a note"
    click_button "Create Conversation"

    expect(current_path).to eq conversation_path(Conversation.last)
    expect(page).to have_content "Successfully created a new conversation"
    expect(page).to have_content "A cool conversation"
    expect(page).to have_content "This is a note"
  end
end
