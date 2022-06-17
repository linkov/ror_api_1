ActiveAdmin.setup do |config|

  config.site_title = ""
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_admin_user_session_path
  config.batch_actions = true
  config.localize_format = :long
  config.comments = false
  config.before_filter :set_admin_locale

  # config.namespace :admin do |admin|
  #   admin.build_menu do |menu|
  #     menu.add label: 'Dashboard', priority: 0
  #     menu.add label: 'System', priority: 3
  #     menu.add label: 'Promo tools', priority: 4
  #     menu.add label: 'Queminar', priority: 5
  #     menu.add label: 'Taggitator', priority: 6
  #     menu.add label: 'Rate tools',  priority: 7
  #     menu.add label: 'User generated',  priority: 8
  #   end
  # end


  # config.default_actions do
  #   # root actions
  #   dashboard                     # mandatory
  #   # collection actions
  #   index                         # mandatory
  #   new
  #   export
  #   history_index
  #   bulk_delete
  #   # member actions
  #   show
  #   edit
  #   delete
  #   history_show
  #   show_in_app
  #
  #   # Add the nestable action for configured models
  #   nestable
  # end


end
