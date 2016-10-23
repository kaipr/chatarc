require "rails_helper"

feature "Add conversation", type: :feature do
  scenario "starting from root path" do
    visit root_path

    click_link "Add Conversation"

    expect(current_path).to eq new_conversation_path
  end

  scenario "submitting with everything set" do
    visit new_conversation_path

    fill_form :conversation,
              title: "A cool conversation",
              note: "This is a note",
              content: "[sam]: this is a message"
    click_button "Create Conversation"

    expect(current_path).to eq conversation_path(Conversation.last)
    expect(page).to have_content "Successfully created a new conversation"
    expect(page).to have_content "A cool conversation"
  end

  scenario "submitting empty form" do
    pending "implement error handling"
    visit new_conversation_path

    click_button "Create Conversation"

    expect(page).to have_content "Error"
    expect(current_path).to eq new_conversation_path
  end
end
