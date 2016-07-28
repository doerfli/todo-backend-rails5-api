class TodosController < ApplicationController

  def index
    render :json => Todo.all
  end

  def create
    todo = Todo.create(todo_params)
    todo.url = todo_url todo
    todo.save
    render :json => todo
  end

  def show
    render :json => Todo.find( id: params[:id])
  end

  def update
    todo = Todo.find( id: params[:id])
    todo.update_attributes(todo_params)
    render :json => todo
  end

  def destroy_all
    Todo.destroy_all
  end

  def destroy
    todo = Todo.find( id: params[:id])
    todo.destroy
    render :json => {}
  end

  private

  def todo_params
    params.permit(:title, :completed, :order)
  end

end