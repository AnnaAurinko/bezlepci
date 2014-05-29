require 'spec_helper'

describe "actualities/new" do
  before(:each) do
    assign(:actuality, stub_model(Actuality,
      :title => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new actuality form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", actualities_path, "post" do
      assert_select "input#actuality_title[name=?]", "actuality[title]"
      assert_select "textarea#actuality_body[name=?]", "actuality[body]"
    end
  end
end
