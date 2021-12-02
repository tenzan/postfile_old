class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_conversation

    def create
        @post = @conversation.posts.new(post_params)
        @post.author = current_user

        respond_to do |format|
           if @post.save                  
                format.html { redirect_to @conversation }
            else
                format.html { flash[:error] = 'Could not save your post for reasons. Please try again' }
            end
        end
           
    end

    private
    def set_conversation
        @conversation = Conversation.find(params[:conversation_id])
    end

    def post_params
        params.require(:post).permit(:body)
    end
end