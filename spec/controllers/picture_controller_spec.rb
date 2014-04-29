require 'spec_helper'

describe PictureController do

  describe "POST 'upload'" do
    describe 'for picturable with one picture' do
      it 'creates a new picturable' do
        post 'upload', picturable_type: 'Comment', picturable: {file: file_fixture('crane.jpg')}, format: :js
        expect(assigns(:picturable)).to be_a_new Comment
      end

      it 'creates a new picture' do
        post 'upload', picturable_type: 'Comment', picturable: {file: file_fixture('crane.jpg')}, format: :js
        expect(assigns(:picturable).picture).to be_a_new Picture
      end

      it 'saves uploaded file' do
        post 'upload', picturable_type: 'Comment', picturable: {file: file_fixture('crane.jpg')}, format: :js
        expect(assigns(:picturable).picture.file).to be
      end
    end

    describe 'for picturable with many pictures' do
      it 'returns http success' do
        post 'upload', picturable_type: 'Lesson', picturable: {files: [file_fixture('crane.jpg')]}, format: :js
        expect(response).to be_success
      end
    end

    describe 'for not picturable' do
      it 'returns http success' do
        post 'upload', picturable_type: 'Topic', picturable: {files: [file_fixture('crane.jpg')]}, format: :js
        expect(response.status).to eq 400
      end
    end
  end
end
