class GetEmailsRuleControllerController < ApplicationController

 
  before_action :load_get_emails_hook 
  before_action :load_get_emails_rule, only: [:show, :edit, :update, :destroy]


   
      
  def load_get_emails_hook
    @get_emails_hook = current_account.get_emails_hooks.find(params[:get_emails_hook_id])
  end 

  def load_get_emails_rule
    @get_emails_rule = @get_emails_hook.get_emails_rules.find(params[:id])
  end

  def index
    @get_emails_rules = @get_emails_hook.get_emails_rules
                            .where(GetEmailsRule.arel_table[:email].matches("%#{@__general_string}%"))
                            .page(params[:page])

    respond_to do |format|
      format.js
      # format.html {render 'dashboard/dashboard/all_get_emails_rules.haml'}
    end
  end

  def new
    @get_emails_rule = GetEmailsRule.new(account: current_account)
    respond_to do |format|
      format.js
    end
  end

  def create
    @get_emails_rule = GetEmailsRule.create(get_emails_rule_params.merge!(account: current_account))
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
end


