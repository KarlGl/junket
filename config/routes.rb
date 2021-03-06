Junket::Engine.routes.draw do

  # Templates for campaigns. Email subject, email body with placeholders, SMS body.
  resources :sequence_templates do
    # Templates the user can edit
    get :mine, on: :collection

    # Templates the user can only read
    get :public, on: :collection
  end

  resources :action_templates, only: [:index, :show, :create, :update, :destroy]

  # Properties that campaigns can be targeted by, e.g. 'Phone Number Equals'
  resources :filters, only: [:index]

  # Filters with values for a specific campaign
  resources :filter_conditions, only: [:index, :show, :create, :update, :destroy]

  # Sequences
  # TODO: Include read/opened/reaches stats.
  resources :sequences, except: [:update, :destroy] do

    # get :targets_count, on: :member
  end

  # Recipients of a sent campaign. Includes read status and tracking.
  # resources :recipients

  resource :webhooks, controller: 'webhooks', only: [:create, :show]

end
