# ActiveAdmin.register PromoMessage do
#
#   menu parent: 'Promo tools'
#   before_filter :skip_sidebar!, :only => :index
#
#   permit_params :title, :target_rate_count, :promo_message_translations_attributes => [:title, :locale, :id]
#
#   index  do
#     column :title
#     column :target_rate_count
#     actions
#   end
#
#   show do
#     attributes_table do
#       row :target_rate_count
#     end
#
#
#     panel "Translations" do
#       table_for promo_message.promo_message_translations do
#         column :title
#         column :locale
#
#       end
#
#     end
#   end
#
#
#   form do |f|
#     f.inputs "" do
#       f.input :target_rate_count
#     end
#
#     f.inputs :translations do
#       f.has_many :promo_message_translations do |g|
#         g.input :locale, :as => :select, :collection => I18n.available_locales
#         g.input :title
#       end
#     end
#
#
#
#
#     f.actions
#   end
#
#
#
#
#
#
#
#
#
#
#
# end
