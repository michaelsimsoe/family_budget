class InvitationsController < ApplicationController
	# before_action :set_member_request, except: [:index, :create]
	# skip_before_action :user_has_budget?
	skip_before_action :user_has_budget?
	def index
		@incoming = Invitation.where(member: current_user)
 		# @outgoing = current_user.owner_or_member_of_budget?.invitations
	end

	def create
		budget = current_user.owner_or_member_of_budget?
		user = User.find(params[:user_id])
		@invitation = Invitation.new(family_budget_id: budget.id, user_id: user.id)

		if @invitation.save
      flash[:notice] = "Request sent!"
    else
    	flash[:alert] = "Something went wrong!"
    end  
    redirect_to root_path
	end

	def update
		@invitation = current_user.invitation
		@member_request = User.find(current_user.id).member_requests.first
		budget = FamilyBudget.find(params[:budget_id])
		@user_budget = UserBudget.create(family_budget_id: budget.id, user_id: current_user.id)
		if @user_budget.save
			redirect_to root_path			
			flash[:notice] = "You joined a Budget!"
		else
			flash[:alert] = "Something went wrong!"
		end
		
		Invitation.destroy(@invitation.id)
		MemberRequest.destroy(@member_request.id)
		
		# Destroy evt member_requests...
	end

	def destroy
		# @member_request = User.find(params[:user_id]).member_requests.first
		# MemberRequest.destroy(@member_request.id)
		# redirect_to root_path
	end

	private

	def set_member_request
		@member_request = MemberRequest.find(params[:id])
	end
end
