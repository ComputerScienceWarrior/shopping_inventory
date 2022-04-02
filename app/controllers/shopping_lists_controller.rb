class ShoppingListsController < ApplicationController
    before_action :find_shopping_list, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
        @shopping_list = ShoppingList.new
    end

    def create
        @shopping_list.create shopping_list_params
        if @shopping_list.save
            redirect_to user_shopping_list_path(current_user, @shopping_list)
        else
            render :new
        end
    end

    def edit 
    end

    def update
        if @shopping_list.update shopping_list_params
            redirect_to user_shopping_list_path(current_user, @shopping_list)
        else
            render :edit
        end
    end

    def destroy
        @shopping_list.destroy
        redirect_to user_path(current_user)
    end

    private

    def find_shopping_list
        @shopping_list = ShoppingList.find(params[:id])
    end

    def shopping_list_params
        params.(:shopping_list).permit(:name, :user_id)
    end
end
