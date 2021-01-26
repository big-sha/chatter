class PostsController < ApplicationController
  include CableReady::Broadcaster

  def index
    @posts = Post.all.all.order(created_at: :desc)
    @post = Post.new
  end

    post = Post.create(post_params)
    cable_ready["timeline"].insert_adjacent_html(
      selector: "#timeline",
      position: "afterbegin",
      html: render_to_string(partial: "post", locals: {post:post})
    )
    cable_ready_broadcast
    redirect_to posts_path

  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_post
    #   @post = Post.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def post_params
      #params.require(:post).permit(:username, :body, :likes_count, :reposts_count)
      params.require(:post).permit(:body)
    end
end
