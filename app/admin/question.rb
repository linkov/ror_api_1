ActiveAdmin.register Question do
  config.per_page = 200
  before_filter :skip_sidebar!, :only => :index
  menu parent: 'Queminar'

  action_item do
    link_to "Quick Add", 'questions/dosmth', :method => :post
  end

  # collection_action :dosmth, method: :post do
  #   redirect_to collection_path, notice: "CSV imported successfully!"
  # end

  member_action :dosmth, :method=>:post do

  end


  controller do
    def dosmth
      question = Question.new()
      question.save!
      redirect_to admin_questions_path
    end
  end

  scope :all, default: true
  scope("Disabled") { |scope| scope.where(active: false) }
  scope("Choosomatic") { |scope| scope.where(slider_type: SliderType.where(:code => "choosomatic").first) }
  scope("User generated") { |scope| scope.where.not(user_id:nil) }

  batch_action :delete_all_tags_for do |ids|
      Question.find(ids).each do |question|
        question.art_categories.delete_all
      end
      redirect_to collection_path, alert: "Updated Questions tags"
    end

  batch_action :delete_all_links_for do |ids|
        Question.find(ids).each do |question|
          question.link = nil
          question.save
        end
        redirect_to collection_path, alert: "Updated Questions links"
  end

  batch_action :deactivate do |ids|
      Question.find(ids).each do |question|
        question.update_attribute(:active,false)
      end
      redirect_to collection_path, alert: "Updated Questions status"
    end

  batch_action :activate do |ids|
      Question.find(ids).each do |question|
        question.update_attribute(:active,true)
      end
      redirect_to collection_path, alert: "Updated Questions status"
    end

  batch_action :set_tags_for do |selection|
      render '_batch_edit'
  end

  collection_action :process_batch_edit_update, :method => :post do
      questions = Question.where(:id => params['questions'])
      questions.each do |q|
        q.art_categories = ArtCategory.where(:id => params['art_categories'])
        q.save
      end
      redirect_to collection_path, :notice => "Your records have been updated"
  end


  # index as: :block do |question|
  #     div for: question do
  #         render "question_partial", question: question
  #     end
  #   end

  index  do
    selectable_column

    # column 'Tags' do |question|
    #   question.art_categories.pluck(:title)
    # end

    column :package, :sortable => 'questions.package_id' do |question|
        best_in_place question, :package_id , :as => :select, :collection => Hash[Package.pluck(:id, :title)], url: [:admin,question]
    end
    column :phrasing do |question|
        best_in_place question, :phrasing_id , :as => :select, :collection => Hash[Phrasing.pluck(:id, :code)], url: [:admin,question]
    end
    column :slider_type, :sortable => 'questions.slider_type_id' do |question|
        best_in_place question, :slider_type_id , :as => :select, :collection => Hash[SliderType.pluck(:id, :code)], url: [:admin,question]
    end
    column 'EN' do |question|
        best_in_place question.question_translations.where(:locale => 'en').first_or_create, :title , :as => :input, url: [:admin,question.question_translations.where(:locale => 'en').first]
    end
    column 'DE' do |question|
        best_in_place question.question_translations.where(:locale => 'de').first_or_create, :title , :as => :input, url: [:admin,question.question_translations.where(:locale => 'de').first]
    end

    column :importance do |question|
        best_in_place question, :importance , :as => :select, :collection => ['1','2','3','4','5','6','7','8','9','10'], url: [:admin,question]
    end

    column :link do |question|
        best_in_place question, :link , :as => :input, url: [:admin,question]
    end

    actions
  end



  show do


    panel "Translations" do
      table_for question.question_translations do
        column :title
        column :locale
      end
    end

    attributes_table do
      row :link
      row :video
      row :active
    end




    panel "Suggestions" do

      table_for question.suggestions do
        column :title
      end
    end


    panel "Tags" do

      table_for question.art_categories do
        column :title
      end
    end

  end



    form do |f|

      tabs do
        tab 'Basic' do

          f.inputs do
            f.input :emocard
          end

        end


    end


     f.actions

    end


# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

 permit_params :importance, :link, :emocard, :max_taggitator_words,:banned,:slider_wording_10_de,:slider_wording_20_de,:slider_wording_30_de,:slider_wording_40_de,:slider_wording_50_de,:slider_wording_60_de,:slider_wording_70_de,:slider_wording_80_de,:slider_wording_90_de,:slider_wording_100_de,:slider_wording_10_en,:slider_wording_20_en,:slider_wording_30_en,:slider_wording_40_en,:slider_wording_50_en,:slider_wording_60_en,:slider_wording_70_en,:slider_wording_80_en,:slider_wording_90_en,:slider_wording_100_en, :phrasing_id, :active, :quality_limit, :quality_limit_rate_count, :package_id, :video,:placeholder, :slider_type_id, :rating_type_id, :rate_level_id, :title,:question_translations_attributes => [:slider_wording_10, :slider_wording_20, :slider_wording_30, :slider_wording_40, :slider_wording_50, :slider_wording_60, :slider_wording_70, :slider_wording_80, :slider_wording_90, :slider_wording_100, :title, :locale, :id],:suggestions_attributes => [:_destroy, :negative_impact, :title, :id,:suggestion_translations_attributes =>[:_destroy, :id,:locale,:title]  ],art_category_ids:[]


#
# or
#



end
