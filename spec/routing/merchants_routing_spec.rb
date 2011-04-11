require "spec_helper"

describe MerchantsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/merchants" }.should route_to(:controller => "merchants", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/merchants/new" }.should route_to(:controller => "merchants", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/merchants/1" }.should route_to(:controller => "merchants", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/merchants/1/edit" }.should route_to(:controller => "merchants", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/merchants" }.should route_to(:controller => "merchants", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/merchants/1" }.should route_to(:controller => "merchants", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/merchants/1" }.should route_to(:controller => "merchants", :action => "destroy", :id => "1")
    end

  end
end
