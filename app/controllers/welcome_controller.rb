class WelcomeController < ApplicationController
  all_posts = Post.all

  def index
    'index.html.erb'
  end
end
