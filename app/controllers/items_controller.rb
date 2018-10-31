class ItemsController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.where(area: params[:format])
  end
  
  def show
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = '投稿しました。'
      redirect_to @item
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @item.update(item_params)
      flash[:success] = '正常に更新されました'
      redirect_to @item
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @item.destroy
    flash[:success] = '削除しました。'
    redirect_to root_path
  end
  
  private

  # Strong Parameter
  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:name, :area, :content, :picture)
  end
  
  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    unless @item
      redirect_to root_url
    end
  end
end
