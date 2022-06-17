class AddTranslationToNotifications < ActiveRecord::Migration
  def change
    Webnotification.create_translation_table!({
      :title => :string,
      :detail => :text
    }, {
      :migrate_data => true,
      :remove_source_columns => true
    })
  end
end
