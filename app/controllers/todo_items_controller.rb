class TodoItemsController < ApplicationController
 before_action :find_todo_list

  def create
    @todo_item = @todo_list.todo_items.build(set_params)
    @todo_item.save

    redirect_to @todo_list
  end

  def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])
    @todo_item.destroy
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
