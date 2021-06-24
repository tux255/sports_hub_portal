module Admin
  class CategoriesController < Admin::BaseController
    def index
      @categories = policy_scope(Category)
      authorize @categories
    end

    def show
      category = Category.find(params[:id])
      @title = category.title

      @posts = category.subcategory_posts
      authorize category
    end

    def new
      @category = Category.new
      authorize @category
    end

    def create
      @category = current_user.categories.new(category_params)
      authorize @category

      if @category.save
        render 'index'
      else
        render 'new'
      end
    end

    def edit
      @category = Category.find(params[:id])
    end

    def update
      category = Category.find(params[:id])

      if category.update(category_params)
        render :show
      else
        render :edit
      end
    end

    private

    def category_params
      params.require(:category).permit(:title, :parent_id)
    end
  end
end
