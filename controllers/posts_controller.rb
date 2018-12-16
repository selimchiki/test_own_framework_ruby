class PostsController < BaseController
    def index
        @posts = Post.all
        render "posts/index.html.erb"
    end
end