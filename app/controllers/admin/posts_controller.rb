module Admin
  class PostsController < Admin::BaseController
    before_action :set_post, only: %i[show edit update destroy]

    # GET /posts
    def index
      @posts = policy_scope(Post)
      @categories = Category.all
      authorize @posts
    end

    # GET /posts/1
    def show
      @post = Post.find(params[:id])
    end

    # GET /posts/new
    def new
      @post = Post.new
      authorize @post
    end

    # GET /posts/1/edit
    def edit
      byebug
      @post = Post.find(params[:id])
      @post.image.attach(params[:image])
    end

    # POST /posts
    def create
      @post = current_user.posts.new(post_params)
      authorize @post

      if @post.save
        redirect_to @post, notice: 'Post was successfully created'
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      redirect_to %i[admin edit], notice: 'Post was successfully updated' if @post.update(post_params)
    end

    # DELETE /posts/1
    def destroy
      redirect_to posts_url, notice: 'Post was successfully deleted' if @post.destroy
    end

    private

    def set_post
      @post = Post.find(params[:id])
      authorize @post
    end

    def post_params
      params.require(:post).permit(:title, :body, :content, :user_id, :image)
    end
  end
end
