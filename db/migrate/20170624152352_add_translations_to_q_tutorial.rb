class AddTranslationsToQTutorial < ActiveRecord::Migration
  def self.up
    QTutorial.create_translation_table!({
                                            :title => :string,
                                            :text => :text,
                                        }, {
                                            :migrate_data => false
                                        })
  end

  def self.down
    QTutorial.drop_translation_table! :migrate_data => false
  end
end
