require 'spec_helper'

describe "products/index.html.erb" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :productname => "Productname",
        :subgroup => "Subgroup",
        :maingroup => "Maingroup",
        :user_id => 1
      ),
      stub_model(Product,
        :productname => "Productname",
        :subgroup => "Subgroup",
        :maingroup => "Maingroup",
        :user_id => 1
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Productname".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subgroup".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Maingroup".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
