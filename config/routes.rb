Casein::Application.routes.draw do 





  scope "(:locale)", :locale => /en|fr/ do
    resources :videos, :only => [:index, :show]
    match "mark_it_up/preview" => "mark_it_up#preview"
  
  #match "/photoreports" => ""
  #match '/opencreate' => 'users#create',:as => :open_id_create,  :requirements => { :method => :get }
  match 'home/send_contact' => 'home#send_contact', :as => :send_contact
  match 'home/facebook' => 'home#facebook', :as => :facebook
  match 'contact' => 'home#contact', :as => :contact
    
   resources :categories,  :only => [:index] do
      resources :articles, :only => [:index, :show]
    end



    resources :photography, :controller=> :gallery_types,  :only => [:index] do
      resources :galleries, :only => [:index, :show]
    end
  end

	#Casein routes
	namespace :casein do
		resources :gallery_types do 
			member do 
					 put 'enabledisable'
			end
	  end
		resources :galleries do 
			member do 
					 put 'enabledisable'
					 put 'flush'
			end
	  end
		resources :locations do 
			member do 
					 put 'enabledisable'
			end
	  end

    resources :dashboard , :only => [:index, :show] 
		resources :videos do
      member do
        put 'enabledisable'
      end
    end
		resources :gallery_types
    
    resources :articles do
      member do
        put 'enabledisable'
        get 'overview'
      end
    end
    resources :categories do 
      resources :articles  do
        member do
          get 'overview'
        end
      end
    end
		
		resources :translations do
		  member do
		    get 'smart_edit'
		    get 'smart_update'
		  end
		  collection do
		    get 'translations'
	    end
	  end

	    
		
		resources :galleries do
      member do
        put 'enabledisable'
        post 'sort'
      end
		  resources :photos do
		    collection do
		      get 'import'
	      end
		    member do
		      post 'set_default'
	      end
	    end
	  end
	end
	
  root :to => "home#index"


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
