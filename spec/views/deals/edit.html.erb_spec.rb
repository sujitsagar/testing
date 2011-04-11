require 'spec_helper'

describe "deals/edit.html.erb" do
  before(:each) do
    @deal = assign(:deal, stub_model(Deal,
      :new_record? => false,
      :name => "MyString",
      :city_id => 1,
      :image => "MyString",
      :details => "MyText"
    ))
  end

  it "renders the edit deal form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => deal_path(@deal), :method => "post" do
      assert_select "input#deal_name", :name => "deal[name]"
      assert_select "input#deal_city_id", :name => "deal[city_id]"
      assert_select "input#deal_image", :name => "deal[image]"
      assert_select "textarea#deal_details", :name => "deal[details]"
    end
  end
end
