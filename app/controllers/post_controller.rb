class PostController < ApplicationController

  def posts
    'posts.html.erb'
  end

  def new
    render 'new.html.erb', locals: { post: Post.new }
  end
end
