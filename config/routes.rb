require 'sidekiq/web'

Rails.application.routes.draw do


  unless Rails.env.test?
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
  end


   mount Sidekiq::Web => '/sidekiq'
  #  mount :adm => '/adm'




   namespace :admin do
     post 'questions/dosmth' => 'questions#dosmth'
     post 'works/removequestion' => 'works#removequestion'
   end


   namespace :adm do
     resources :questions
   end

   namespace :api, defaults: {format: :json} do
    match 'expertise_tags' => 'api#expertise_tags', :via => :get
    match 'general_info' => 'api#general_info', :via => :get
    match 'landingexpertises/:id' => 'api#landingexpertises', :via => :get
    match 'landing_art_categories/:id' => 'api#landing_art_categories', :via => :get

    match 'landingwork' => 'api#landingwork', :via => :get
    match 'landingexpert/:user_id' => 'api#landingexpert', :via => :get
    match 'landingexperts' => 'api#landingexperts', :via => :get
    match 'art_categories' => 'api#art_categories', :via => :get
    match 'parent_art_categories' => 'api#parent_art_categories', :via => :get


    namespace :v1 do

        namespace :admin do
          resources :activities
          resources :questions
          resources :question_tags
          resources :art_categories
          resources :q_tutorials
          resources :question_links
          resources :slider_types
          resources :suggestions
          resources :packages
          resources :works
          resources :ratings

          resources :proficiencies
          resources :tutorial_types
          resources :manualflowpics

          match 'users/me' => 'users#me', :via => :get

          resources :users
          resources :suggestion_words
          resources :suggestion_word_choices

          get 'openquestions' => 'ratings#open'


        end


      get 'tags' => 'ratings#tags'
      get 'work_stats' => 'ratings#overall_stats'
      get 'tag_stats' => 'ratings#tag_stats'
      get 'pic_stats' => 'ratings#overall_pic_stats'
      get 'liverate' => 'ratings#liverate'
      get 'work_stats_extended' => 'ratings#overall_stats_extended'
      get 'work_mvp_stats_extended' => 'ratings#overall_stat_mvp_extended'
      get 'work_mvp_stats_extended_v2' => 'ratings#overall_stat_mvp_extended_v2'
      get 'suggests' => 'suggestion_choices#suggests'

      put 'pic_order/:id' => 'pictures#pic_order'


      match 'users/me' => 'users#me', :via => :get

      resource :omniauth
      resources :art_categories
      resources :parent_art_categories
      resources :question_tags
      resources :suggestion_choices
      resources :suggestions
      resources :suggestion_words
      resources :suggestion_word_choices
      resources :users
      resources :tutorials
      resources :manualflowpics
      resources :tutorial_steps
      resources :webnotifications
      resources :webnotificationflows
      resources :questions
      resources :question_links
      resources :bans
      resources :presentations
      resources :slider_types
      resources :backrates
      resources :expertises
      resources :q_tutorials

      resources :reviewpayments

      resources :testawork_choices
      resources :frontend_translations

      resources :works do
        resources :pictures
      end

      resources :focus
      resources :rating_types
      resources :promo_messages
      resources :ratings

      resources :packages
      resources :charges

      resources :messages
      resources :conversations do
        resources :messages
      end


      # get 'omniauth/facebook/callback', to: 'omniauth#facebook'



      get 'weekly_charts' => 'rating_types#weekly_charts'




      get 'users/:id/settings', to: 'users#settings', as: 'settings'
      get 'users/:id/managecontent', to: 'users#managecontent', as: 'managecontent'
      get 'users/:id/statistics', to: 'users#statistics', as: 'statistics'

      get '/work_categories' => 'work_categories#index'
      get '/work_categories/:id' => 'work_categories#show'
      get '/work_categories/:id/ratetypes' => 'work_categories#ratetypes'

      get '/works/:id/nextquestion' => 'works#nextquestion'
      get 'users/:id/ratecount' => 'users#ratecount'



      post '/works/:id/rate' => 'works#rate'
      post '/webnotificationflows/:id/markread' => 'webnotificationflows#markread'

      # mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      #     sessions:'device_session',
      #     token_validations:'device_token_validation'
      # }


    end
  end

   mount_devise_token_auth_for 'User', at: 'api/v1/auth' , controllers: {
       sessions:'device_session',
       registrations:'device_registration',
       token_validations:'device_token_validation',
       passwords:'device_token_password',
       omniauth_callbacks: 'omniauth_callbacks'

   }





  #  root :to => redirect('/frontend/')
  #  # root to: 'ember_frontend#index'
  #  get '*path' => redirect('/frontend/')


end
