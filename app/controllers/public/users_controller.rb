class Public::UsersController < ApplicationController
  def show
    
  end

  def edit
    
  end
  
  def update
    
  end
  
  def unsubscribe
    
  end

  def withdraw
    
  end

 



  private
  def user_params
     params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :telephone_number)
  end
  
end
