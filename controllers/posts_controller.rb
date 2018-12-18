class PostsController < BaseController

    def index
        info "Accueil de tout les posts vu"
        @posts = Post.all
        headers "Cache-Control" => 'private, max-age=30'
        render "posts/index.html.erb"
    end

    def show
        if (@post = Post[params["id"]])
            FrameworkLogger.info "Post n° #{params["id"]} vu"
            render "posts/show.html.erb"
        else
            error_404
        end
    end

    def delete
        post = Post[params["id"]]
        post.delete

        redirect_to "/posts"
    end

    def new
        @post = Post.new
        render "posts/new.html.erb"
    end

    def create
        Post.create(title: params["title"],
                    content: params["content"],
                    gif: params["gif"],
                    date: Time.now)
        redirect_to "/posts"
    end

    def edit
        @post = Post[params["id"]]
        render "/posts/edit.html.erb"
    end

    def update
        post = Post[params["id"]]
        post.update(title: params["title"],
                    content: params["content"],
                    gif: params["gif"],
                    date: Time.now)
        redirect_to "/posts"
    end


end