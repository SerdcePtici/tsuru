require 'spec_helper'

describe CommentsController do
  describe 'routing' do

    it 'routes to #create' do
      expect(post: '/lessons/1/comments').to route_to('comments#create', lesson_id: '1')
      expect(post: '/stories/1/comments').to route_to('comments#create', story_id: '1')
      expect(post: '/albums/1/comments').to route_to('comments#create', album_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/comments/1').to route_to('comments#destroy', id: '1')
    end

  end
end
