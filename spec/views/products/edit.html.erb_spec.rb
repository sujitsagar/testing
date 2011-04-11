require 'spec_helper'

describe "products/edit.html.erb" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :new_record? => false,
      :productname => "MyString",
      :subgroup => "MyString",
      :maingroup => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => product_path(@product), :method => "post" do
      assert_select "input#product_productname", :name => "product[productname]"
      assert_select "input#product_subgroup", :name => "product[subgroup]"
      assert_select "input#product_maingroup", :name => "product[maingroup]"
      assert_select "input#product_user_id", :name => "product[user_id]"
    end
  end
end
