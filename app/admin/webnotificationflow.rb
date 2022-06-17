ActiveAdmin.register Webnotificationflow do

  menu parent: 'Notifications'
  before_filter :skip_sidebar!, :only => :index

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
permit_params :code, :route

end
