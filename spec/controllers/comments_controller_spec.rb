require 'spec_helper'

describe CommentsController do

  # This should return the minimal set of attributes required to create a valid
  # Comment. As you add validations to Comment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { attributes_for(:comment) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CommentsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'POST create' do
    let(:story) { create(:story)}

    describe 'with valid params' do
      it 'creates a new Comment' do
        expect {
          xhr :post, :create, {comment: valid_attributes, story_id: story}, valid_session
        }.to change(Comment, :count).by(1)
      end

      it 'assigns a newly created comment as @comment' do
        xhr :post, :create, {comment: valid_attributes, story_id: story}, valid_session
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved comment as @comment' do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Comment).to receive(:save).and_return(false)
        xhr :post, :create, {comment: {'author' => 'invalid value'}, story_id: story}, valid_session
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it "renders the 'create' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Comment).to receive(:save).and_return(false)
        xhr :post, :create, {comment: {'author' => 'invalid value'}, story_id: story}, valid_session
        expect(response).to render_template('create')
      end
    end
  end

  describe 'DELETE destroy' do
    before { sign_in create(:admin) }
    let!(:comment) {create(:comment)}

    it 'destroys the requested comment' do
      expect {
        xhr :delete, :destroy, {id: comment.to_param}, valid_session
      }.to change(Comment, :count).by(-1)
    end

    it 'renders the "destroy" template' do
      xhr :delete, :destroy, {id: comment.to_param}, valid_session
      expect(response).to render_template('destroy')
    end
  end
end
