class TodoItemsController < ApplicationController
  before_action :find_todo_list

  def create
    @todo_item = @todo_list.todo_items.new(set_params)

    @todo_item.save
    redirect_to @todo_list
  end

 private
    def find_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
    end

    def set_params
      params.require(:todo_item).permit(:content)
    end
end
