class StaticPagesController < ApplicationController
  def home
    @products = Product.all
    @categories = Category.all
    @orderitems = Orderitem.all
    
  end
  
  def category
    st = params[:name]
    
    @products = Product.where("category_id like ? ", st)
  end


  def help
  end

  def about
  end
  
  def orderConfirmed
  
  
  end
  
  def paid
    # redirect_to "/cart/clear"
    #flash[:notice] = 'Transaction Complete'
    @order = Order.last
    @order.update_attribute(:status , "Paid by User: #{current_user.email}")
    #"Paid by User:#{current_user.id} #{current_user.name} #{current_user.surname}")
    
  end

end
