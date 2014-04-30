require 'spec_helper'

describe LessonsController do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/lessons').to route_to('lessons#index')
    end

    it 'routes to #new' do
      expect(:get => '/lessons/new').to route_to('lessons#new')
    end

    it 'routes to #show' do
      expect(:get => '/lessons/1').to route_to('lessons#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/lessons').to route_to('lessons#create')
    end

    it 'routes to #destroy' do
      expect(:delete => '/lessons/1').to route_to('lessons#destroy', :id => '1')
    end

  end
end
