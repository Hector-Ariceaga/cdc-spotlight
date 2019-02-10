class API::V1::ArticlesController < ApplicationController

    def index
        articles = Article.all
        render json: articles, status: 200
    end

    def create
        article = Article.new(article_params)
        if article.save
            render json: article, status: 201
        else
            render json: {errors: {messages: article.errors.messages }}, status: 422
        end
    end

    def show
        article = Article.find_by(id: params[:id])
        if article
            render json: article, status: 200
        else 
            render json: {errors: {message: {article: "can't be found."}}}, status: 404
        end
    end

    private

    def article_params
        params.require(:article).permit(:title, :author, :description, :url)
    end
end
