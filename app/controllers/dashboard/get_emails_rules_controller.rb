class Dashboard::GetEmailsRulesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_get_emails_rule, only: [:show, :edit, :update, :destroy]


  

  def load_get_emails_rule
    @get_emails_rule = current_user.get_emails_rules.find(params[:id])
  end

  def index
    @get_emails_rules = current_user.get_emails_rules.page(params[:page])

    respond_to do |format|
      format.js
    end
  end

  def new
    @get_emails_rule = GetEmailsRule.new(user: current_user)
    respond_to do |format|
      format.js
    end
  end

  def create
    @get_emails_rule = GetEmailsRule.create(get_emails_rule_params.merge!(user: current_user))
    respond_to do |format|
      if @get_emails_rule.save
        format.js
      else
        flash[:alert] = "Oops, your get_emails_rule could not be saved."
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
      if !@get_emails_rule.save
        flash[:alert] = "Get Emails Rule could not be saved"
      end
      format.js {}
    end
  end

  def destroy
    respond_to do |format|
      begin
        @get_emails_rule.destroy
      rescue StandardError => e
        flash[:alert] = "Get Emails Rule could not be deleted"
      end
      format.js {}
    end
  end

  def get_emails_rule_params
    params.require(:get_emails_rule).permit( [:abc, :def, :ghi, :something_at, :something_color] )
  end

  def default_colspan
    5
  end

  def namespace
    
      "dashboard/"
    
  end


  def common_scope
    @nested_args
  end

end


