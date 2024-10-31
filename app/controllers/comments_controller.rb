class CommentsController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params) 
      @comment.user_id = current_user.id
      @comment.commenter = current_user.name

      if @comment.save
        redirect_to post_path(@post)
      else
        puts "There was an error creating the comment."
        #render 'posts/show' , status: :unprocessable_entity  # Re-render the post's show page with errors
        render 'posts/show', status: :unprocessable_entity
      end
    end

    def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to post_path(@post), status: :see_other
    end
  
    private
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end
  end
  