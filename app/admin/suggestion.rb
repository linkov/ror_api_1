ActiveAdmin.register Suggestion do

  menu parent: 'Sliders'
  before_filter :skip_sidebar!, :only => :index


  controller do
    respond_to :html, :js, :json
  end

  
  index  do
    column :question
    column :title
    actions
  end

end
