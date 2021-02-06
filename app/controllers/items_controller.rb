class ItemsController < ApplicationController
    #layout false
    skip_before_action :verify_authenticity_token
    before_action :find_item , only: [:edit, :update, :show, :destory, :upvote]
    #before_action :admin? ,    only: [:edit, :update, :new, :create, :destory]
    

    def index
      @items = Item.all
      
    end

    def create
      item=Item.create(items_params)
      if item.persisted?
        redirect_to items_path
      else
        render json: item.errors, status: :unprocessable_entity
      end
    end
    def new

    end

    def edit
      
        render body: 'Page not found', status: 404 unless @item 
     
    end

    def show
      
        render body: 'Page not found', status: 404 unless @item 
      
    end
    
    def update
     #@item
     if @item.update(items_params)
      redirect_to items_path
     else
      render json: item.errors, status: :unprocessable_entity
     end
    end

    def destroy
      
      if @item.destroy.destroyed?
        redirect_to items_path
      else
        render json: item.errors, status: :unprocessable_entity
      end
    end

    def upvote
      @item.increment!(:votes_count)
      redirect_to items_path
    end

    private

    def items_params
      params.permit(:name, :price,:real, :weight, :description)
    end

    def find_item
      @item = Item.where(id: params[:id]).first
    end

    def admin?
      true
     # render json: 'Acces denied' , status: :forbidden unless params[:admin]
    end

    
end
