class PostController < ApplicationController

  def index
    render 'index.html.erb', locals: { post: Post.all }
  end

  def posts
    'posts.html.erb'
  end

  def new
    render 'new.html.erb', locals: { post: Post.new }
  end

  def show
    blog_entry = Post.find(params[:id])
    begin
      respond_to do |format|
        format.html do
          render 'show.html.erb', locals: { post: blog_entry }
        end
        format.json do
          redirect_to json: blog_entry
        end
      end
    rescue ApplicationController::ParameterMissing => error
      render json: { error: error.message }, status: 422
    end
  end

  def create
    begin
      new_post = Post.create(post_params)
      respond_to do |format|
        format.html do
          redirect_to :show => 'show', :id=> params[:post][:id]
        end
        format.json do
          render json: new_post
        end
      end
    rescue ApplicationController::ParameterMissing => error
      render json: { error: error.message }, status: 422
    end
  end # create

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end # class
