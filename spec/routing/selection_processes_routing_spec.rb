require 'spec_helper'

describe SelectionProcessesController do
  describe 'routing' do
    it 'routes to #index' do
      get('/selection_processes').should route_to('selection_processes#index')
    end

    it 'routes to #new' do
      get('/selection_processes/new').should route_to('selection_processes#new')
    end

    it 'routes to #show' do
      get('/selection_processes/1').should route_to('selection_processes#show', :id => '1')
    end

    it 'routes to #edit' do
      get('/selection_processes/1/edit').should route_to('selection_processes#edit', :id => '1')
    end

    it 'routes to #create' do
      post('/selection_processes').should route_to('selection_processes#create')
    end

    it 'routes to #update' do
      put('/selection_processes/1').should route_to('selection_processes#update', :id => '1')
    end

    it 'routes to #destroy' do
      delete('/selection_processes/1').should route_to('selection_processes#destroy', :id => '1')
    end
  end
end
