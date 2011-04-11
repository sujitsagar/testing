require 'spec_helper'

describe "products/show.html.erb" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :productname => "Productname",
      :subgroup => "Subgroup",
      :maingroup => "Maingroup",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Productname/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Subgroup/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Maingroup/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
