class PostsController < ApplicationController
before_action :move_to_index, except: [:index, :show, :search]

def index
  @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(3)
  @users= User.order("created_at DESC").page(params[:page]).per(4)
  @talk = Post.where(category_id: "2").order("created_at DESC").page(params[:page]).per(3)
  @work = Post.where(category_id: "3").order("created_at DESC").page(params[:page]).per(4)
end

def create
  @post = Post.create!(post_params)
  redirect_to root_path
end

def new
  @post = Post.new
  @parents = Category.all.order("id ASC").limit(4)
end

def show
  @post = Post.find(params[:id])
  @comment = Comment.new
  @comments = @post.comments.includes(:user)
end

def edit
  @post = Post.find(params[:id])

  @category = @post.category
  
end

def update
  post = Post.find(params[:id])
  post.update(post_params)
  redirect_to post_path(post.id)
end

def destroy
  post = Post.find(params[:id])
  post.destroy
  redirect_to root_path
end

def search
  @posts = Post.search(params[:keyword])
end

private

def post_params
  params.require(:post).permit(:title, :image, :price, :category_id, :content).merge(user_id: current_user.id)
end

def move_to_index
  redirect_to action: :index unless user_signed_in?
end

end