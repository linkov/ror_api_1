ActiveAdmin.register Picture do

  menu parent: 'System'
  before_filter :skip_sidebar!, :only => :index

  index  do
    selectable_column
    column :work
    column "Image" do |pack|
      image_tag pack.image.url(:thumb)
    end
    actions
  end

end
