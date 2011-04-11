require 'spec_helper'

describe "deals/index.html.erb" do
  before(:each) do
    assign(:deals, [
      stub_model(Deal,
        :name => "Name",
        :city_id => 1,
        :image => "Image",
        :details => "MyText"
      ),
      stub_model(Deal,
        :name => "Name",
        :city_id => 1,
        :image => "Image",
        :details => "MyText"
      )
    ])
  end

  it "renders a list of deals" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
