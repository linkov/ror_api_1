ActiveAdmin.register User do
  config.per_page = 200
  menu parent: 'User generated'
  before_filter :only => :index

  scope :all, default: false
  scope("Experts") { |scope| scope.where(flexreview: true) }
  scope("Regular") { |scope| scope.where(flexreview: false) }

  index  do
    selectable_column
    column :price
    column :email
    column :tagline
    column :expertemail
    column :flexadmin
    column :flexreview
    column :freereview
    column :locale
    column "Image" do |user|
      image_tag user.picture.url(:thumb)
    end
    actions
  end

  controller do
      def update_resource(object, attributes)
        update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
        object.send(update_method, *attributes)
      end
  end

  form do |f|

    tabs do

      tab 'Basic' do
        f.inputs "" do
          f.input :flexadmin
          f.input :flexreview
          f.input :freereview
          f.input :name
          f.input :price
          f.input :tagline
          f.input :shortbio, :input_html => { :maxlength => 190 }
          f.input :sharepic
          f.input :email
          f.input :expertemail
          f.input :password
          f.input :website
          f.input :about
          f.input :picture, :as => :file, :hint => image_tag(f.object.picture.url(:preview))
        end
      end

      tab 'Expertise' do
        f.inputs do
          input :expertise_ids, label:'Expertise', collection: Expertise.all.collect {|x| [x.title, x.id]}, as: :select, multiple: true, input_html: { class: "chosen-input",  style: "width: 700px;height: 700px;"}
        end
      end

      tab 'Areas of Focus' do
        f.inputs do
          input :art_category_ids, label:'Area of focus', collection: ArtCategory.all.collect {|x| [x.title_en, x.id]}, as: :select, multiple: true, input_html: { class: "chosen-input",  style: "width: 700px;height: 700px;"}
        end
      end

      tab 'Portfolio representation' do
            f.has_many :portfoliopics do |pic|
                pic.input :picture, :as => :file, :hint => image_tag(pic.object.picture.url(:preview))
                pic.input :order
                pic.input :_destroy, :as => :boolean, :label => "remove"
                #repeat as necessary for all fields
            end
      end


  end


   f.actions

  end




# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :price, :freereview, :tagline, :shortbio, :sharepic, :flexadmin, :flexreview, :name, :about, :picture, :email, :password, :website, :expertemail,art_category_ids:[], expertise_ids:[],:portfoliopics_attributes =>[:_destroy, :id,:picture,:order]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
