require 'rails_helper'

describe Dashboard::ThingsController do
  render_views
  let(:current_user) {create(:user)}
  let(:thing) {create(:thing, user: current_user )}



  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:account]

    sign_in current_user, scope: :user
  end

  describe "index" do
    it "should respond" do
      get :index, xhr: true, format: 'js', params: {
          
      }
    end
  end

  describe "new" do
    it "should show form" do
      get :new, xhr: true, format: 'js', params: {
          
      }
    end
  end

  describe "create" do
    it "should create a new thing" do
      expect {
        post :create, xhr: true, format: 'js', params: {
          
            thing: {
                a: 'Koala', b: '969', c_at: '2020-08-02 09:00:56 -0400', user_id: '106'
        }}
      }.to change { Thing.all.count }.by(1)
      assert_response :ok
    end

    # it "should not create if there are errors" do
    #   post :create, xhr: true, format: 'js',  params: {id: thing.id,
    #                                                    thing: {skin_id: nil}}
    #
    #   expect(controller).to set_flash.now[:alert].to(/Oops, your thing could not be saved/)
    # end
  end

  describe "edit" do
    it "should return an editable form" do
      get :edit, xhr: true, format: 'js',  params: {
          
          id: thing.id
      }
      assert_response :ok
    end
  end

  describe "show" do
    it "should return a view form" do
      get :show, xhr: true, format: 'js',  params: {
          
          id: thing.id
        }
      assert_response :ok
    end
  end

  describe "update" do
    it "should update" do
      put :update, xhr: true, format: 'js',
          params: {
            
            id: thing.id,
            thing: {
                a: 'Kangaroo', b: '110', c_at: '2020-08-04 09:00:56 -0400', user_id: '612'
            }}

      assert_response :ok
    end

    # it "should not update if invalid" do
    #   put :update, xhr: true, format: 'js',
    #       params: {
    #         id: thing.id,
    #         thing: {
    #           a: 'Lobster', b: '92', c_at: '2020-07-31 09:00:56 -0400', user_id: '105'
    #       }}
    #
    #   assert_response :ok
    #
    #   expect(controller).to set_flash.now[:alert].to(/Oops, your thing could not be saved/)
    # end
  end

  describe "#destroy" do
    it "should destroy" do
      post :destroy, format: 'js', params: {
          
          id: thing.id
      }
      assert_response :ok
      expect(Thing.count).to be(0)
    end
  end
end

