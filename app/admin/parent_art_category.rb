ActiveAdmin.register ParentArtCategory do

  menu parent: 'System'
  before_filter :skip_sidebar!, :only => :index

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
 permit_params :code, :title, :order, :parent_art_category_translations_attributes => [:id, :title, :locale],art_category_ids:[]

  index  do
    selectable_column

    column :order

    column 'Categories' do |parentartcategory|
      parentartcategory.art_categories.collect(&:title)
    end

    column 'EN' do |parentartcategory|
        best_in_place parentartcategory.parent_art_category_translations.where(:locale => 'en').first_or_create, :title , :as => :input, url: [:admin,parentartcategory.parent_art_category_translations.where(:locale => 'en').first]
    end
    column 'DE' do |parentartcategory|
        best_in_place parentartcategory.parent_art_category_translations.where(:locale => 'de').first_or_create, :title , :as => :input, url: [:admin,parentartcategory.parent_art_category_translations.where(:locale => 'de').first]
    end

    actions
  end

  show do


    panel "Child art categories" do

      table_for parent_art_category.art_categories do
        column :title
      end
    end

  end

  form do |f|

    tabs do

      tab 'Basic' do

        f.inputs "Translations" do
          f.input :order
          f.input :code
          f.has_many :parent_art_category_translations do |g|
            g.input :locale, :as => :select, :collection => I18n.available_locales
            g.input :title
          end
        end
      end

      tab 'Art categories' do
        f.inputs do
          input :art_category_ids, label:'Art categories', collection: ArtCategory.all.collect {|x| [x.title, x.id]}, as: :select, multiple: true, input_html: { class: "chosen-input",  style: "width: 700px;height: 700px;"}
        end
      end


  end


   f.actions

  end

end
