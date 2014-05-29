require 'spec_helper'

describe "novinkies/new" do
  before(:each) do
    assign(:novinky, stub_model(Novinky,
      :title => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new novinky form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", novinkies_path, "post" do
      assert_select "input#novinky_title[name=?]", "novinky[title]"
      assert_select "textarea#novinky_body[name=?]", "novinky[body]"
    end
  end
end
