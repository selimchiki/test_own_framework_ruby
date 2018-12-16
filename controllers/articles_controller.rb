class ArticlesController < BaseController
    def index
        articles = Article.all 
        puts "----------------"
        p articles
        puts "----------------"
        [200, {}, ["et voici la solution"]]
    end
end