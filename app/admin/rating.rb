ActiveAdmin.register Rating do

  menu parent: 'User generated'
  filter :author_email, as: :string
  filter :work
  # before_filter :skip_sidebar!, :only => :index
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
  permit_params :work_id,:question_id,:author_id,:score


  index  do
    selectable_column
    id_column
    column "Author"  do |rating|
      rating.author.email.to_s
    end
    column :score
    column :work, :sortable => 'ratings.work_id'
    column :question, :sortable => 'ratings.question_id'
    actions
  end


end
