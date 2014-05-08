require 'spec_helper'

describe AlbumsController do
  describe 'routing' do

    it 'routes to #new' do
      expect(get: '/topics/1/albums/new').to route_to('albums#new', topic_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/albums/1').to route_to('albums#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/topics/1/albums').to route_to('albums#create', topic_id: '1')
    end

    it 'routes to #update' do
      expect(put: '/albums/1').to route_to('albums#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/albums/1').to route_to('albums#destroy', id: '1')
    end

  end
end
