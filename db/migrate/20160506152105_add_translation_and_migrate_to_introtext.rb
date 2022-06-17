class AddTranslationAndMigrateToIntrotext < ActiveRecord::Migration
  def self.up
    Introtext.create_translation_table!({
                                             :text => :text,
                                         }, {
                                             :migrate_data => true
                                         })
  end

  def self.down
    Introtext.drop_translation_table! :migrate_data => true
  end
end
