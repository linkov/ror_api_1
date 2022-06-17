ActiveAdmin.register Webnotification do

  menu parent: 'Notifications'
  before_filter :skip_sidebar!, :only => :index

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
index  do
  selectable_column
  column "Flow", :sortable => 'webnotificationflows.code' do |note|
    note.webnotificationflow.code
  end
  column :order
  column :title
  column :image
  actions
end

form do |f|
  f.inputs "" do
    f.input :order
    f.input :title_en
    f.input :title_de
    f.input :image, :as => :file, :label => 'Preview image', :hint => image_tag(f.object.image.url(:thumb))
    f.input :webnotificationflow_id, :label => 'Flow', :as => :select, :collection => Webnotificationflow.all.map{|u| ["#{u.code}", u.id]}
  end
  f.actions
end

permit_params :title, :detail,:title_en,:title_de,:detail_en,:detail_de, :image, :webnotificationflow_id, :order

end
