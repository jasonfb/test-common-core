require 'rails_helper'


describe Dashboard::ThingsController do
  render_views
  let(:current_user) {create(:user)}
  let(:thing) {create(:thing, user: current_user )}

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:account]
    sign_in :user, current_user # sign_in(scope, resource)
  end


  describe "index" do
    it "should respond" do
      get :index, xhr: true, format: 'js'
    end
  end

  describe "new" do
    it "should show form" do
      get :new, xhr: true, format: 'js'
    end
  end

  describe "create" do
    it "should create a new crusade" do
      expect {
        post :create, xhr: true, format: 'js', params: {
            thing: {
            name: "Abc crusade",
        }}
      }.to change { Thing.all.count }.by(1)
      assert_response :ok
    end

    # it "should not update if there are errors" do
    #   post :create, xhr: true, format: 'js',  params: {id: thing.id,
    #                                                    thing: {skin_id: nil}}
    #
    #   expect(controller).to set_flash.now[:alert].to(/Oops, your thing could not be saved/)
    # end
  end

  describe "edit" do
    it "should show the object as editable" do
      get :edit, xhr: true, format: 'js',  params: {id: thing.id}
      assert_response :ok
    end


    it "should show form has html" do
      get :edit, xhr: true,  format: 'js',  params: {id: thing.id}
      assert_response :ok

    end
  end

  describe "update" do

    it "should update" do
      put :update, xhr: true, format: 'js',
          params: {
            id: thing.id,
            thing: {
                a: 'Fox', b: '117', c_at: '2020-07-19 11:49:07 -0400', user_id: '434'
            }}

      assert_response :ok
    end

    # it "should not update if invalid" do
    #   put :update, xhr: true, format: 'js',
    #       params: {
    #         id: thing.id,
    #         thing: {
    #           a: 'Water Buffalo', b: '168', c_at: '2020-07-20 11:49:07 -0400', user_id: '117'
    #       }}
    #
    #   assert_response :ok
    #
    #   expect(controller).to set_flash.now[:alert].to(/Oops, your thing could not be saved/)
    # end
  end

  describe "#destroy" do
    it "should destroy" do
      post :destroy, format: 'js', params: { id: thing.id }
      assert_response :ok
      expect(Thing.count).to be(0)
    end
  end

end

