class Api::V1::PostsController < ApplicationController

    skip_before_action :authorize, only: [:create, :index, :show]

    def create
        post = Post.create( post_params )
            if post.valid?
            render json: { post: PostSerializer.new(post)}, status: :created
            # render json: { post: post, token: issue_token(user_id: post.id) }, status: :created
         else
            render json: { errors: post.errors.full_messages }, status: :not_accepted
         end
        end
    
        def index
            @posts = Post.all
            render json: { posts: @posts.map{ |post| PostSerializer.new(post) }}
        end
    
        private
    
        def post_params
            params.require(:post).permit(:content, :user_id, :discussion_id)
        end
            


end
