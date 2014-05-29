require 'spec_helper'

describe "actualities/show" do
  before(:each) do
    @actuality = assign(:actuality, stub_model(Actuality,
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
