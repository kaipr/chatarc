require 'test_helper'

feature 'Add conversation' do
  scenario 'go to add conversation from root' do
    visit root_path

    click_link 'Add Conversation'

    current_path.must_equal new_conversation_path
  end

  scenario 'add a conversation' do
    visit new_conversation_path

    fill_in 'Title', with: 'A cool conversation'
    fill_in 'Note', with: 'This is a note'
    click_button 'Create Conversation'

    current_path.must_equal conversation_path(Conversation.last)
    page.must_have_content 'Successfully created a new conversation'
    page.must_have_content 'A cool conversation'
    page.must_have_content 'This is a note'
  end
end
