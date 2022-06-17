class Api::V1::SuggestionWordChoiceSerializer < ActiveModel::Serializer
  attributes :id, :suggestion_word_id, :work_id, :question_id, :word

  def word
    word_object = SuggestionWord.where(:id => object.suggestion_word_id).first
    if word_object
      word_object.word
    end
  end

end
