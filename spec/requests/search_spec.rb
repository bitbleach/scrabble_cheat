require 'rails_helper'

RSpec.describe "Search", :type => :request do
  it 'posts a valid search term' do
    post "/search", params: { search: { query: 'term' } }
    assert_select "div.definition", { maximum: 6 }
  end
  
  it "doesn't define a fake word without initialization" do
    post "/search", params: { search: { query: 'dfghg' } }
    assert_select "div.definition", 0
    assert_select "div", "This word is not valid."
    post "/search", params: { search: { query: ' dfghg' } }
    assert cookies['dfghg']
    assert_select "div.definition", { maximum: 4 }
  end
end
