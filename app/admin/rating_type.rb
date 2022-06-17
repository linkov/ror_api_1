# module Admin
#
#   ActiveAdmin.register RatingType do
#
#     menu parent: 'Queminar'
#     before_filter :only => :index
#     sortable tree: true
#
#
#
#    permit_params :package_id, :limit, :limit_rate_count, :priority, :name,:parent,:focu_id, :work_category_ids, :parent_id, :children, :code,:rating_type_translations_attributes => [:name, :locale, :id],:rate_type_descriptions_attributes => [:focu_id,:rate_level_id,:id,:rate_type_description_translations_attributes => [:description, :locale, :id]],:rate_type_description_translations_attributes => [:description, :locale, :id],
#                  :questions_attributes => [:rate_type_id, :slider_type_id, :rate_level_id,:id,:question_translations_attributes => [:title, :locale, :id]],
#                  :tutorials_attributes => [:rate_type_id,:id,:tutorial_steps_attributes => [:video, :image, :order, :id,:tutorial_step_translations_attributes =>[:id,:locale,:text] ]]
#
#
#
#
    # batch_action :assign_to_package, form: {
    #     package: Package.all.collect {|package| [package.title, package.id] },
    # } do |ids, inputs|
    #   rating_types = RatingType.find(ids) # selected trips
    #   rating_types.each do |r| r.update_attribute(:package_id,inputs[:package]) end
    #   redirect_to collection_path, notice: 'Updated Rating Types Package'
    # end
#
#
#     index :as => :sortable do
#       label :name_and_priority
#       # label :name.to_s+'dasd'
#       actions
#     end
#
#
#     show do
#
#       tabs do
#
#       tab 'Basic' do
#         attributes_table do
#           # row :name
#           row :priority
#           row :package
#         end
#
#         panel "Belongs to these work categories" do
#           table_for rating_type.work_category do
#             column :name
#             # column 'Score' do |rating_type|
#             #   if rating_type.rating.first
#             #     rating_type.rating.first.score
#             #   end
#             # end
#
#           end
#         end
#
#
#         panel "Thresholds" do
#           attributes_table do
#             row :limit
#             row :limit_rate_count
#           end
#
#         end
#
#
#         panel "Translations" do
#           table_for rating_type.rating_type_translations do
#             column :name
#             column :locale
#
#           end
#
#         end
#
#         panel "Descriptions" do
#           rating_type.rate_type_descriptions.each  do |desc|
#
#             table_for desc.rate_type_description_translations do
#               column :description
#               column :locale
#
#             end
#
#           end
#         end
#       end
#
#
#
#       tab 'Related' do
#
#
#
#           # child_ratetypes = RatingType.where(:)
#
#           # table_for rating_type.questions do
#           #   column :title
#           #   column :rating_type
#           # end
#
#           rating_type.subtree.each do |child_type|
#
#             panel child_type.name do
#             table_for child_type.questions do
#               column :title
#             end
#
#
#           end
#
#
#         end
#
#
#
#
#       end
#
#       tab 'Additional info' do
#
#         panel "Immediate Children" do
#           table_for rating_type.children do
#             column :name
#
#           end
#         end
#       end
#
#
#
#
#         end
#
#     end
#
#
#
#
#     form do |f|
#
#
#       tabs do
#         tab 'Basic' do
#
#           f.inputs "" do
#             f.input :priority, :as => :radio, :collection => [1,2,3,4,5,6,7,8,9,10]
#             f.input :package
#             # f.input :code
#             # f.input :work_category
#             # f.input :focu,  collection: Focu.order(:id),include_blank: false
#           end
#
#           f.inputs :translations do
#             f.has_many :rating_type_translations do |g|
#               g.input :locale, :as => :select, :collection => I18n.available_locales
#               g.input :name
#             end
#           end
#
#         end
#
#         tab 'Thresholds' do
#
#           f.inputs "" do
#             f.input :limit
#             f.input :limit_rate_count
#           end
#
#         end
#
#         tab 'Descriptions' do
#
#           f.inputs :descriptions do
#             f.has_many :rate_type_descriptions do |description|
#               # description.input :rating_type
#               description.input :rate_level
#
#
#               description.has_many :rate_type_description_translations do |k|
#                 k.input :locale, :as => :select, :collection => I18n.available_locales
#                 k.input :description
#               end
#
#             end
#           end
#
#         end
#
#         tab 'Questions' do
#
#           f.inputs :questions do
#             f.has_many :questions do |q|
#               # q.input :rating_type
#               q.input :rate_level
#               q.input :slider_type
#
#
#               q.has_many :question_translations do |k|
#                 k.input :locale, :as => :select, :collection => I18n.available_locales
#                 k.input :title
#               end
#
#             end
#           end
#
#         end
#
#         tab 'Tutorials' do
#
#           f.inputs :tutorials do
#             f.has_many :tutorials do |tut|
#
#
#
#               tut.has_many :tutorial_steps do |step|
#
#                 step.input :video, :as => :file, :hint => step.template.video_tag(step.object.video.url)
#                 step.input :image, :as => :file, :hint => step.template.image_tag(step.object.image.url(:thumb))
#                 step.input :order
#                 step.has_many :tutorial_step_translations do |k|
#                   k.input :locale, :as => :select, :collection => I18n.available_locales
#                   k.input :text,:input_html => { :rows => 5, :cols => 20 }
#                 end
#                 #repeat as necessary for all fields
#               end
#
#
#             end
#           end
#
#         end
#
#
#       end
#
#
#
#       f.actions
#     end
#
#   end
# end
