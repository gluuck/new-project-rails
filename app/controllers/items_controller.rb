class ItemsController < ApplicationController
    layout false
    skip_before_action :verify_authenticity_token
    def index
      @items = Item.all
      
    end

    def create
      item=Item.create(items_params)
      if item.persisted?
        render json: item.name, status: :created
      else
        render json: item.errors, status: :unprocessable_entity
      end
    end
    def new

    end

    def edit

    end

    def show
      unless (@item = Item.where(id: params[:id]).first)
        render body: 'Page not found', status: 404
      end
    end
    
    def update

    end

    def destroy
      item = Item.where(id: params[:id]).first.destroy
      if item.destroyed?
        redirect_to items_path
      else
        render json: item.errors, status: :unprocessable_entity
      end
    end

    private

    def items_params
      params.permit(:name, :price,:real, :weight, :description)
    end
end
