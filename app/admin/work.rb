ActiveAdmin.register Work do

  menu parent: 'User generated'
  before_filter :only => :index

  permit_params :presentation_id, :user,:work_category, :focu, :description, :url, :picture, :is_active, :is_visible,:user_id, :work_category_id, :focu_id, :title, :onboarding, :public

  member_action :removequestion, :method=>:post do
  end

  controller do
    def removequestion
      question = Question.find(params[:q])
      work = Work.find(params[:id])
      work.questions.delete(question)

      redirect_to admin_work_path(params[:id])
    end
  end

  index  do
    selectable_column
    column :title
    column 'pictures' do |work|
      work.pictures.count
    end
    column :work_category
    column :is_visible
    column 'packages' do |work|
      work.packages.collect(&:title)
    end
    actions
  end

  batch_action 'Stop showing' do |ids|
    Work.where(:id =>[ids]).each do |wrk|
      wrk.update_attribute(:is_visible, false)
    end
    redirect_to collection_path
  end

  batch_action 'Start showing' do |ids|
    Work.where(:id =>[ids]).each do |wrk|
      wrk.update_attribute(:is_visible, true)
    end
    redirect_to collection_path
  end


  form do |f|
    f.inputs "" do
      f.input :onboarding
      f.input :public

    end
    f.actions
  end

  show do
    attributes_table do
      row :presentation
      row :title
      row :is_visible
      row :audio
      row :wavescreenshot
      row :user
      row :average_rating
      row :work_category
      row :cover_id do |obj|
        image_tag Picture.where(:id => obj.cover_id).first.image.url(:preview) if Picture.where(:id => obj.cover_id).first
      end

      panel 'Pics' do
        table_for work.pictures do
          column "Image" do |pic|
            image_tag pic.image.url(:thumb)
          end

        end
      end

      panel 'Expert Version Pics' do
        table_for work.manualflowpics do
          column "Image" do |pic|
            image_tag pic.url
          end

        end
      end

      panel "keywords" do
        table_for work.art_categories.each  do
          column :title

        end
      end

      panel "packages" do
        table_for work.packages.each  do
          column :title

        end
      end


      panel "questions" do
        table_for work.questions.each do
          column :title
          column "remove from work" do |question|
            link_to "remove", work.id.to_s+'/removequestion?q='+question.id.to_s, :method => :post
            # link_to('remove','removequestion?q='+question.id.to_s+'&work='+work.id.to_s)
          end

        end
      end


    end

  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#



end
