class AddTranslationsToPromoMessage < ActiveRecord::Migration
  def self.up
    PromoMessage.create_translation_table!({
                                               :title => :text,
                                           })
  end

  def self.down
    PromoMessage.drop_translation_table!
  end
end
