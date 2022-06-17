ActiveAdmin.register Package do

before_filter :skip_sidebar!, :only => :index
menu parent: 'Queminar'
permit_params :price, :description, :image, :video, :title, :code, :author, :active, :work_category_id,
              :questions_attributes => [:package_id, :slider_type_id,  :quality_limit, :quality_limit_rate_count,:video, :placeholder, :id,:question_translations_attributes => [:title, :locale, :id]]

# action_item :only => :show do
#   link_to("Make a Copy", clone_admin_package_path(id: package.id))
# end
 member_action :clone, method: :get do
    n = resource.amoeba_dup
    n.save
    redirect_to admin_packages_path
  end

  index  do
    selectable_column
    id_column
    column :title
    column :active
    column :work_category do |pack|
        best_in_place pack, :work_category_id , :as => :select, :collection =>  Hash["", "None"].merge(Hash[WorkCategory.pluck(:id, :name)]), url: [:admin,pack]
    end
    actions
  end





  show do
    attributes_table do
      row :title
      row :active
      row :description

      panel 'Questions' do
        table_for package.questions do
          column :title

        end
      end

    end

  end


  form do |f|


    tabs do
      tab 'Basic' do

        f.inputs "" do
          f.input :code
          f.input :active
          f.input :title
          f.input :author
          f.input :price
          f.input :description
          f.input :image, :as => :file, :label => 'Preview image', :hint => image_tag(f.object.image.url(:thumb))
          f.input :video, :as => :file, :hint => video_tag(f.object.video.url)
        end
      end


      # tab 'Questions' do
      #
      #   f.inputs :questions do
      #     f.has_many :questions do |q|
      #       q.input :_destroy, :as => :boolean, :label => "remove question"
      #       q.input :package
      #       q.input :quality_limit
      #       q.input :quality_limit_rate_count
      #       q.input :video, :as => :file, :hint => video_tag(q.object.video.url)
      #       q.input :placeholder, :as => :file, :hint => image_tag(q.object.placeholder.url(:preview))
      #       q.input :slider_type,  :as => :select, :collection => SliderType.pluck(:code, :id)
      #
      #       q.inputs :suggests do
      #
      #
      #       q.has_many :suggestions do |suggestion|
      #
      #         suggestion.has_many :suggestion_translations do |k|
      #           k.input :locale, :as => :select, :collection => I18n.available_locales
      #           k.input :title
      #         end
      #
      #         end
      #
      #
      #       end
      #
      #
      #       q.has_many :question_translations do |k|
      #         k.input :locale, :as => :select, :collection => I18n.available_locales
      #         k.input :title
      #       end
      #
      #     end
      #   end
      #
      # end

    end

    f.actions
  end

end
