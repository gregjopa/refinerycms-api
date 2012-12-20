Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :events do
    resources :events, :path => '', :only => [:index, :show]
    resources :api, :controller => :events_api, :path => 'integration/api',
      :except => [:new, :edit]    
  end

  # Admin routes
  namespace :events, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :events, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
