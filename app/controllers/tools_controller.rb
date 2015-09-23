class ToolsController < ApplicationController
  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
    @reviews = @tool.reviews
    @review = @tool.reviews.build
  end
end
