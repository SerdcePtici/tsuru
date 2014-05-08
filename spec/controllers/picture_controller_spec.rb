require 'spec_helper'

describe PictureController do

  describe "POST 'upload'" do
    describe 'for picturable with one picture' do
      it 'creates a new picturable' do
        post 'upload', picturable_type: 'Comment', picturable: {files: file_fixture('crane.jpg')}, format: :js
        expect(assigns(:picturable)).to be_a_new Comment
      end

      it 'creates a new picture' do
        post 'upload', picturable_type: 'Comment', picturable: {files: file_fixture('crane.jpg')}, format: :js
        expect(assigns(:picturable).picture).to be_a_new Picture
      end

      it 'saves uploaded file' do
        post 'upload', picturable_type: 'Comment', picturable: {files: file_fixture('crane.jpg')}, format: :js
        expect(assigns(:picturable).picture.file).to be_present
      end

      it 'returns http success' do
        post 'upload', picturable_type: 'Comment', picturable: {files: file_fixture('crane.jpg')}, format: :js
        expect(response).to be_success
      end

      context 'when the file is not picture' do
        it 'does not save uploaded file' do
          post 'upload', picturable_type: 'Comment', picturable: {files: file_fixture('malicious.js')}, format: :js
          expect(assigns(:picturable).picture.file).to be_blank
        end

        it 'returns bad request' do
          post 'upload', picturable_type: 'Comment', picturable: {files: file_fixture('malicious.js')}, format: :js
          expect(response.status).to eq 400
        end
      end
    end

    describe 'for picturable with many pictures' do
      it 'returns http success' do
        post 'upload', picturable_type: 'Lesson', picturable: {files: [file_fixture('crane.jpg')]}, format: :js
        expect(response).to be_success
      end
    end

    describe 'for not picturable' do
      it 'returns http bad request' do
        post 'upload', picturable_type: 'Topic', picturable: {files: [file_fixture('crane.jpg')]}, format: :js
        expect(response.status).to eq 400
      end
    end
  end
end
