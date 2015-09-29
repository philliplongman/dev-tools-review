class ToolsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tool, only: [:destroy]
  before_action :authorize_user, only: [:destroy]
  def index
    @tools = Tool.order(:name).page params[:page]
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

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    flash[:alert] = "Tool deleted"
    redirect_to tools_path
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    if @tool.save
      flash[:notice] = "Successfully created a new dev tool!"
      redirect_to tool_path(@tool)
    else
      flash[:errors] = @tool.errors.full_messages.join(" | ")
      @categories = Category.all
      render :new
    end
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
