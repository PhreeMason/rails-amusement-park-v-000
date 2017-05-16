class UsersController < ApplicationController
    
    def create
        
    end
    
    def new
       @user = User.new 
    end
    
    def update
        
    end
    
    def destroy
        
    end
    
    private
        def user_params
            params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
        end
        
    
end
