class CollectionsController < ApplicationController
    before_action :authenticate_admin!, only: [:create, :update, :destroy]
  
    def index
      @collections = Collection.all
      render json: @collections
    end
  
    def show
      @collection = Collection.find(params[:id])
      render json: @collection
    end
  
    def create
      @collection = Collection.new(collection_params)
      if @collection.save
        render json: @collection, status: :created
      else
        render json: @collection.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @collection = Collection.find(params[:id])
      if @collection.update(collection_params)
        render json: @collection
      else
        render json: @collection.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @collection = Collection.find(params[:id])
      @collection.destroy
      head :no_content
    end
  
    private
  
    def collection_params
      params.require(:collection).permit(:title, :description, :publish)
    end
  end
  