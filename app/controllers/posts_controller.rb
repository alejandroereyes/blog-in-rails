class PostsController < ApplicationController

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
      respond_to do |format|
        format.html do
          render 'show.html.erb', locals: { post: blog_entry }
        end
        format.json do
          redirect_to json: blog_entry
        end
      end
  end

  def create
    new_post = Post.create(post_params)
    respond_to do |format|
      format.html do
        redirect_to :action => 'show', :id => new_post.id
      end
      format.json do
        render json: new_post
      end
    end
  end # create

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end # class
