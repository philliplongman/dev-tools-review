class ToolsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tools = Tool.all
  end

  def show
    @reviews = Review.all
    @tool = Tool.find(params[:id])

  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    # Dummy data until models are connected
    @tool.user = current_user
    @tool.category_id = 1
    if @tool.save
      flash[:notice] = "Successfully created a new dev tool!"
      redirect_to tool_path(@tool)
    else
      flash[:errors] = "Please fill out both fields."
      render :new
    end
  end

  private
  def tool_params
    params.require(:tool).permit(:name, :description)
  end
end
