ActiveAdmin.register TutorialType do

  menu parent: 'System'
  before_filter :skip_sidebar!, :only => :index

  permit_params :code,:icon, :name

end
