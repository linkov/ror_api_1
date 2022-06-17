require 'rails_helper'

RSpec.describe SuggestionWordBlackListItem, type: :model do

  it 'it should save word in lower case' do
    item = SuggestionWordBlackListItem.new
    item.word = 'Groovy'
    item.save
    expect(item.word).to eq('groovy')
  end

end
