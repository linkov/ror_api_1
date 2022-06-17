require 'rails_helper'

RSpec.describe Api::V1::SuggestionWordSerializer do

  it 'should include a correct word' do
    new_suggestion_word = FactoryGirl.create(:suggestion_word)
    serializer = Api::V1::SuggestionWordSerializer.new(new_suggestion_word)
    expect(serializer.serializable_hash[:word]).to eq 'groovy'
  end

end

