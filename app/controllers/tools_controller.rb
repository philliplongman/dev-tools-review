class ToolsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tool, only: [:destroy]
  before_action :authorize_user, only: [:destroy]

  def index
    if params[:search]
      @tools = Tool.search(params[:search]).order(:name).page(params[:page]).per(10)
    else
      @tools = Tool.order(:name).page(params[:page]).per(10)
    end
  end

  def show
    @tool = Tool.find(params[:id])
    @reviews = @tool.reviews
    @review = Review.new
    @comment = Comment.new
    @category = @tool.category
  end

  def new
    @tool = Tool.new
    @categories = Category.all
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    if @tool.save
      flash[:success] = "Successfully created a new dev tool!"
      redirect_to @tool
    else
      @categories = Category.all
      flash[:warning] = "Form errors"
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
    @categories = Category.all
  end

  def update
    @tool = Tool.find(params[:id])
    @tool.update(tool_params)
    if @tool.save
      flash[:info] = "Tool updated"
      redirect_to tool_path(@tool)
    else
      @categories = Category.all
      flash[:warning] = "Form errors"
      render :edit
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    flash[:success] = "Tool deleted"
    redirect_to tools_path
  end

  private
  def set_tool
    @tool = Tool.find(params[:id])
  end

  def authorize_user
    unless current_user == @tool.user || current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def tool_params
    params.require(:tool).permit(:name, :category_id, :description)
  end
end
