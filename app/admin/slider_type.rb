ActiveAdmin.register SliderType do

  menu parent: 'Sliders'
  before_filter :skip_sidebar!, :only => :index



end