ActiveAdmin.register Setting do

  menu parent: 'System'
  before_filter :skip_sidebar!, :only => :index
  # actions :all, :except => [:new,:destroy]


  form do |f|
    f.inputs "" do
      f.input :title
      f.input :code
      f.input :value
    end
    f.actions
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :name, :surname, :password, :email
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
