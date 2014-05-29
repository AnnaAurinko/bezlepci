require 'spec_helper'

describe "novinkies/show" do
  before(:each) do
    @novinky = assign(:novinky, stub_model(Novinky,
      :title => "Title",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
