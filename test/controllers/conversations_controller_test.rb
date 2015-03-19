require 'test_helper'

describe ConversationsController do
  describe '#index' do
    it 'must assign conversations and render index' do
      get :index

      assigns(:conversations).wont_be_nil
      must_render_template :index
    end
  end

  describe '#show' do
    it 'must assign the conversation with given id and render show' do
      get :show, id: conversations(:personal).id

      assigns(:conversation).id.must_equal conversations(:personal).id
      must_render_template :show
    end
  end

  describe '#new' do
    it 'must assign conversation and render new' do
      get :new

      assigns(:conversation).wont_be_nil
      must_render_template :new
    end
  end

  describe '#create' do
    let(:conversation_params) { { title: 'A conversation', note: 'A note' } }

    it 'must create a new conversation with given parameters, set flash and redirect to show' do
      assert_difference 'Conversation.count', 1 do
        post_with_token :create, conversation: conversation_params
      end

      flash[:notice].wont_be_nil
      must_redirect_to Conversation.last
    end
  end
end
