module Admin
  class CategoriesController < Admin::BaseController
    def index
      @categories = policy_scope(Category)
      authorize @categories
    end

    def show
      category = Category.find(params[:id])

      @posts = category.posts
      @subcategories = category.subcategories.all
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

    private

    def category_params
      params.require(:categories).permit!
    end
  end
end
