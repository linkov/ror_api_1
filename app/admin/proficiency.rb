ActiveAdmin.register Proficiency do

  menu parent: 'System'
  before_filter :skip_sidebar!, :only => :index
  permit_params :code


end
