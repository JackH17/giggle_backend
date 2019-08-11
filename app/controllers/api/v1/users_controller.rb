class Api::V1::UsersController < ApplicationController
    skip_before_action :authorize, only: [:create, :index, :show]

    def create
        user = User.create( user_params )
            if user.valid?
            render json: { user: UserSerializer.new(user), token: issue_token(user_id: user.id)}, status: :created
            # render json: { user: user, token: issue_token(user_id: user.id) }, status: :created
         else
            render json: { errors: user.errors.full_messages }, status: :not_accepted
         end
        end
    
        def index
            @users = User.all
            render json: { users: @users.map{ |user| UserSerializer.new(user) }}, include: [:groups, :discussions, :memberships]
        end
    
        private
    
        def user_params
            params.require(:user).permit(:username, :first_name, :last_name, :bio, :password)
        end
            
end
