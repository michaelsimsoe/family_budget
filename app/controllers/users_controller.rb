class UsersController < ApplicationController
  skip_before_action :user_has_budget?
	def search
    if params[:search_param].blank?
      flash[:alert] = "You have entered an empty search string"
    else
      @users = User.search(params[:search_param])
      @users = current_user.except_current_user(@users)
      @users = current_user.exclude_if_has_budget(@users)
      flash[:alert] = "No users match this search criteria" if @users.blank?
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end

  def add_user
    @budget = current_user.owner_or_member_of_budget?
    @user = User.find(params[:user])
		@user_budget = UserBudget.create(family_budget: @budget, user: @user)
		
    if @user_budget.save
      puts "User was successfully added"
    else
      puts "There was something wrong with the request"
    end  
    redirect_to root_path
  end

  # def invite_user
  #   @budget = current_user.owner_or_member_of_budget?
  #   @user = User.find(params[:user])
  #   @user_budget = UserBudget.create(family_budget: @budget, user: @user)
    
  #   if @user_budget.save
  #     puts "User was successfully added"
  #   else
  #     puts "There was something wrong with the request"
  #   end  
  #   redirect_to root_path
  # end
end
