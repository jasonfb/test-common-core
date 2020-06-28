class HellosController < ApplicationController


  before_action :load_hello, only: [:show, :edit, :update, :destroy]


  

  def load_hello
    @hello = Hello.find(params[:id])
  end

  def index
    @hellos = Hello.where(Hello.arel_table[:email].matches("%#{@__general_string}%"))
                            .page(params[:page])

    respond_to do |format|
      format.js
      format.html {render 'all_hellos.haml'}
    end
  end

  def new
    @hello = Hello.new()
    respond_to do |format|
      format.js
    end
  end

  def create
    @hello = Hello.create(hello_params)
    respond_to do |format|
      if @hello.save
        format.js
      else
        flash[:alert] = "Oops, your hello could not be saved."
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
      if !@hello.save
        flash[:alert] = "Hello could not be saved"
      end
      format.js {}
    end
  end

  def destroy
    respond_to do |format|
      begin
        @hello.destroy
      rescue StandardError => e
        flash[:alert] = "Hello could not be deleted"
      end
      format.js {}
    end
  end

  def hello_params
    params.require(:hello).permit( [:age, :name, :text, :gender_id] )
  end

  def default_colspan
    4
  end
end


