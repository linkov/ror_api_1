require 'rails_helper'

RSpec.describe SuggestionWord do

  it 'it should save word in lower case' do
    suggest = SuggestionWord.new
    suggest.word = 'Groovy'
    suggest.save
    expect(suggest.word).to eq('groovy')
  end

end

