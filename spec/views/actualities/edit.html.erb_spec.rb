require 'spec_helper'

describe "actualities/edit" do
  before(:each) do
    @actuality = assign(:actuality, stub_model(Actuality,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit actuality form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", actuality_path(@actuality), "post" do
      assert_select "input#actuality_title[name=?]", "actuality[title]"
      assert_select "textarea#actuality_body[name=?]", "actuality[body]"
    end
  end
end
