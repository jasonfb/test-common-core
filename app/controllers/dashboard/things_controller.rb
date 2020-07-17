class Dashboard::ThingsController < ApplicationController

  before_action :authenticate_user!



  before_action :load_thing, only: [:show, :edit, :update, :destroy]


  

  def load_thing
    @thing = current_user.things.find(params[:id])
  end

  def index
    @things = current_user.things.page(params[:page])

    respond_to do |format|
      format.js
    end
  end

  def new
    @thing = Thing.new(user: current_user)
    respond_to do |format|
      format.js
    end
  end

  def create
    @thing = Thing.create(thing_params.merge!(user: current_user))
    respond_to do |format|
      if @thing.save
        format.js
      else
        flash[:alert] = "Oops, your thing could not be saved."
        format.js
      end
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def edit

    respond_to do |format|
      format.js
    end
  end

  def update

    respond_to do |format|
      if !@thing.save
        flash[:alert] = "Thing could not be saved"
      end
      format.js {}
    end
  end

  def destroy
    respond_to do |format|
      begin
        @thing.destroy
      rescue StandardError => e
        flash[:alert] = "Thing could not be deleted"
      end
      format.js {}
    end
  end

  def thing_params
    params.require(:thing).permit( [:a, :b, :c_at, :user_id] )
  end

  def default_colspan
    4
  end

  def namespace
    
      "dashboard/"
    
  end


  def common_scope
    @nested_args
  end

end


