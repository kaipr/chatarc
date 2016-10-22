require "rails_helper"

describe ConversationsController, type: :controller do
  describe "#index" do
    it "renders index with conversations" do
      process :index, method: :get

      expect(assigns(:conversations)).to be_a ActiveRecord::Relation
      expect(response).to render_template :index
    end
  end

  describe "#show" do
    it "renders show with the given conversation" do
      conversation = create(:conversation)

      process :show, method: :get, params: { id: conversation.id }

      expect(assigns(:conversation).id).to eq conversation.id
      expect(response).to render_template :show
    end
  end

  describe "#new" do
    it "renders new with a new conversation" do
      process :new, method: :get

      expect(assigns(:conversation)).to be_a_new(Conversation)
      expect(response).to render_template :new
    end
  end

  describe "#create" do
    it "creates a new conversation and redirects with flash" do
      params = { conversation: attributes_for(:conversation) }

      request = -> { process :create, method: :post, params: params }

      expect(request).to change { Conversation.count }.by(1)
      expect(flash[:notice]).not_to be_nil
      expect(response).to redirect_to Conversation.last
    end
  end
end
