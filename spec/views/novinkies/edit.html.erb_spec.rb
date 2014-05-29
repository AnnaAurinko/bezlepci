require 'spec_helper'

describe "novinkies/edit" do
  before(:each) do
    @novinky = assign(:novinky, stub_model(Novinky,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit novinky form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", novinky_path(@novinky), "post" do
      assert_select "input#novinky_title[name=?]", "novinky[title]"
      assert_select "textarea#novinky_body[name=?]", "novinky[body]"
    end
  end
end
