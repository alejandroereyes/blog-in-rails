class WelcomeController < ApplicationController
  all_posts = Post.all

  def index
    'index.html.erb'
  end

  def about
    'about.html.erb'
  end
end
