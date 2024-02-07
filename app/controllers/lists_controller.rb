class ListsController < ApplicationController
  def index
    if params[:search].present?
      @lists = List.where('lower(name) LIKE ?', "%#{params[:search].downcase}%")
    else
      @lists = List.all
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @review = Review.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
