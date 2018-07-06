class TodoItemsController < ApplicationController
  
 before_action :todo_list_params 
  def create
  	@todo_list = TodoList.find(params[:todo_list_id])
  
   @todo_item = @todo_list.todo_items.create(params_item)
    redirect_to " todo_lists#index
"  
  end
 private

    def todo_list_params

    @todo_list = TodoList.find(params[:todo_list_id])
    end   
    def params_item
    params_item = params[:todo_item].permit(:content)  
    end  
 end
end
