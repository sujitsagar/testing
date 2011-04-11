require 'spec_helper'

describe MerchantsController do

  def mock_merchant(stubs={})
    @mock_merchant ||= mock_model(Merchant, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all merchants as @merchants" do
      Merchant.stub(:all) { [mock_merchant] }
      get :index
      assigns(:merchants).should eq([mock_merchant])
    end
  end

  describe "GET show" do
    it "assigns the requested merchant as @merchant" do
      Merchant.stub(:find).with("37") { mock_merchant }
      get :show, :id => "37"
      assigns(:merchant).should be(mock_merchant)
    end
  end

  describe "GET new" do
    it "assigns a new merchant as @merchant" do
      Merchant.stub(:new) { mock_merchant }
      get :new
      assigns(:merchant).should be(mock_merchant)
    end
  end

  describe "GET edit" do
    it "assigns the requested merchant as @merchant" do
      Merchant.stub(:find).with("37") { mock_merchant }
      get :edit, :id => "37"
      assigns(:merchant).should be(mock_merchant)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created merchant as @merchant" do
        Merchant.stub(:new).with({'these' => 'params'}) { mock_merchant(:save => true) }
        post :create, :merchant => {'these' => 'params'}
        assigns(:merchant).should be(mock_merchant)
      end

      it "redirects to the created merchant" do
        Merchant.stub(:new) { mock_merchant(:save => true) }
        post :create, :merchant => {}
        response.should redirect_to(merchant_url(mock_merchant))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved merchant as @merchant" do
        Merchant.stub(:new).with({'these' => 'params'}) { mock_merchant(:save => false) }
        post :create, :merchant => {'these' => 'params'}
        assigns(:merchant).should be(mock_merchant)
      end

      it "re-renders the 'new' template" do
        Merchant.stub(:new) { mock_merchant(:save => false) }
        post :create, :merchant => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested merchant" do
        Merchant.should_receive(:find).with("37") { mock_merchant }
        mock_merchant.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :merchant => {'these' => 'params'}
      end

      it "assigns the requested merchant as @merchant" do
        Merchant.stub(:find) { mock_merchant(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:merchant).should be(mock_merchant)
      end

      it "redirects to the merchant" do
        Merchant.stub(:find) { mock_merchant(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(merchant_url(mock_merchant))
      end
    end

    describe "with invalid params" do
      it "assigns the merchant as @merchant" do
        Merchant.stub(:find) { mock_merchant(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:merchant).should be(mock_merchant)
      end

      it "re-renders the 'edit' template" do
        Merchant.stub(:find) { mock_merchant(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested merchant" do
      Merchant.should_receive(:find).with("37") { mock_merchant }
      mock_merchant.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the merchants list" do
      Merchant.stub(:find) { mock_merchant }
      delete :destroy, :id => "1"
      response.should redirect_to(merchants_url)
    end
  end

end
