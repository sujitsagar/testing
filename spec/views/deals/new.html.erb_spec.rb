require 'spec_helper'

describe "deals/new.html.erb" do
  before(:each) do
    assign(:deal, stub_model(Deal,
      :name => "MyString",
      :city_id => 1,
      :image => "MyString",
      :details => "MyText"
    ).as_new_record)
  end

  it "renders new deal form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => deals_path, :method => "post" do
      assert_select "input#deal_name", :name => "deal[name]"
      assert_select "input#deal_city_id", :name => "deal[city_id]"
      assert_select "input#deal_image", :name => "deal[image]"
      assert_select "textarea#deal_details", :name => "deal[details]"
    end
  end
end
