class PostsController < ApplicationController

  skip_before_action :verify_authenticity_token

  #show all records
  def index
    @posts = Post.all
    render :json => @posts
  end

  #show an individual record
  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.json {render :json => @post}
    end
  end

  def create
    respond_to do |format|
      format.json {
        parsed_json = JSON.parse(params[:post])
        @post = Post.new(parsed_json['post'])

        if @post.save
          render :json => @post
        else
          render :json => @post.errors.to_json, :status => 400
        end
      }
    end
  end

  def update
    parsed_json = JSON.parse(params[:post])
    @post = Post.find(params[:id])
    @post.update(parsed_json['post'])

    render :json => @posts
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    @posts = Post.all
    render :json => @posts
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end
