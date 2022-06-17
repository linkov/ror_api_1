class SuggestionWordBlackListItem < ActiveRecord::Base
  belongs_to :question

  before_save :downcase_fields


  def downcase_fields
    self.word.downcase!
  end

end
