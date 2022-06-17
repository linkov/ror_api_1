ActiveAdmin.register ArtCategory do

  menu parent: 'System'
  before_filter :skip_sidebar!, :only => :index

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
 permit_params :title, :work_category_id, :art_category_translations_attributes => [:id, :title, :locale],work_category_ids:[]

  index  do
    selectable_column

    column 'Categories' do |artcategory|
      artcategory.work_categories.pluck(:name)
    end

    column 'EN' do |artcategory|
        best_in_place artcategory.art_category_translations.where(:locale => 'en').first_or_create, :title , :as => :input, url: [:admin,artcategory.art_category_translations.where(:locale => 'en').first]
    end
    column 'DE' do |artcategory|
        best_in_place artcategory.art_category_translations.where(:locale => 'de').first_or_create, :title , :as => :input, url: [:admin,artcategory.art_category_translations.where(:locale => 'de').first]
    end

    actions
  end

  show do

    panel "Questions" do

      table_for art_category.questions do
        column :title
      end
    end

    panel "Main categories" do

      table_for art_category.work_categories do
        column :name
      end
    end

  end

  form do |f|

    tabs do

      tab 'Basic' do
        f.inputs "Translations" do
          f.has_many :art_category_translations do |g|
            g.input :locale, :as => :select, :collection => I18n.available_locales
            g.input :title
          end
        end
      end

      tab 'Main categories' do
        f.inputs do
          input :work_category_ids, label:'Main categories', collection: WorkCategory.all.collect {|x| [x.name, x.id]}, as: :select, multiple: true, input_html: { class: "chosen-input",  style: "width: 700px;height: 700px;"}
        end
      end


  end


   f.actions

  end

end
