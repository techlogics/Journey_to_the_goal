class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "作成できました！"
      redirect_to post_path(@post)
    else
      render :template => "posts/show"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to :posts
  end

  private
  def comment_params
    params.require(:comment).permit(
      :body
      )
  end
end
