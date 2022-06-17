class SuggestionWord < ActiveRecord::Base

  has_one :suggestion_word_choice, dependent: :destroy
  has_one :suggestion_word_choice_count, dependent: :destroy

  before_save :downcase_fields


  def downcase_fields
    self.word.downcase!
  end

end
