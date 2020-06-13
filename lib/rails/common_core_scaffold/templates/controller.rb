class <%= controller_class_name %>Controller < ApplicationController
  before_action :authenticate_user!
  before_action :load_<%= singular_name %>, only: [:show, :edit, :update, :destroy]

  def load_<%= singular_name %>
    @<%=singular_name%> = current_account.<%=plural_name%>.find(params[:id])
  end

  def index
    @<%= plural_name %> = current_account.<%=plural_name %>
                            .where(<%=class_name %>.arel_table[:email].matches("%#{@__general_string}%"))
                            .page(params[:page])

    respond_to do |format|
      format.js
      format.html {render 'dashboard/dashboard/all_<%=plural_name %>.haml'}
    end
  end

  def new
    @<%= singular_name %> = <%= class_name  %>.new(account: current_account)
    respond_to do |format|
      format.js
    end
  end

  def create
    @<%=singular_name %> = <%=class_name %>.create(<%=singular_name %>_params.merge!(account: current_account))
    respond_to do |format|
      if @<%= singular_name %>.save
        format.js
      else
        flash[:alert] = "Oops, your <%=singular_name %> could not be saved."
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
      if !@<%=singular_name %>.save
        flash[:alert] = "<%=singular_name.titlecase %> could not be saved"
      end
      format.js {}
    end
  end

  def destroy
    respond_to do |format|
      begin
        @<%=singular_name%>.destroy
      rescue StandardError => e
        flash[:alert] = "<%=singular_name.titlecase %> could not be deleted"
      end
      format.js {}
    end
  end

  def <%=singular_name%>_params
    params.require(:<%=singular_name%>).permit( <%= @columns %> )
  end

  def default_colspan
    <%= @default_colspan %>
  end
end


