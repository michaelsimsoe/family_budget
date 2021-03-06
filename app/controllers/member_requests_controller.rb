class MemberRequestsController < ApplicationController
	# before_action :set_member_request, except: [:index, :create]
	skip_before_action :user_has_budget?
	def index
		@incoming = MemberRequest.where(member: current_user)
 		@outgoing = current_user.owner_or_member_of_budget?.member_requests
	end

	def create
		user = current_user
		budget = FamilyBudget.find(params[:budget_id])
		@member_request = MemberRequest.new(family_budget_id: budget.id, user_id: user.id)

		if @member_request.save
      flash[:notice] = "Request sent!"
    else
    	flash[:alert] = "Something went wrong!"
    end  
    redirect_to root_path
	end

	def update
		@member_request = User.find(params[:user_id]).member_requests.first
		budget = current_user.family_budget.id
		user = params[:user_id]
		useremail = User.find(params[:user_id]).email
		@user_budget = UserBudget.create(family_budget_id: budget, user_id: user)
		if @user_budget.save
			puts "ok"
			respond_to do |format|
    		# format.html { redirect_to no_budget_url }
    		format.json { render :json => @user_budget }
    		format.js
   		end
   		flash[:notice] = "Member was added!"
		else
			flash[:alert] = "Something went wrong!"
		end
		
		MemberRequest.destroy(@member_request.id)
	end

	def destroy
		@member_request = User.find(params[:user_id]).member_requests.first
		MemberRequest.destroy(@member_request.id)
		redirect_to root_path
	end

	private

	def set_member_request
		@member_request = MemberRequest.find(params[:id])
	end
end
