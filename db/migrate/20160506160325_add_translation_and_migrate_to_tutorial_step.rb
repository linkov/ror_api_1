class AddTranslationAndMigrateToTutorialStep < ActiveRecord::Migration
  def self.up
    TutorialStep.create_translation_table!({
                                            :text => :text,
                                        }, {
                                            :migrate_data => true
                                        })
  end

  def self.down
    TutorialStep.drop_translation_table! :migrate_data => true
  end
end
