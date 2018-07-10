class TodoItemsController < ApplicationController
 before_action :find_todo_list
 before_action :set_todo_item ,except: [:create]
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


  def complete
   @todo_item.update_attribute(:completed_at , Time.now)
   redirect_to @todo_list , notice: "Item complete"
  end	
 private

 def find_todo_list
   @todo_list = TodoList.find(params[:todo_list_id])
 end
 def set_todo_item
   @todo_item = @todo_list.todo_items.find(params[:id])
 end
 def set_params
   params.require(:todo_item).permit(:content)
 end
end
