class DemoController < ApplicationController
  
  layout false
  
  def index

  end
  
  def hello
    @array = [1, 2, 3, 4, 5]
    @id = params['id']
    @page = params[:page]
    render(:action => 'hello')
  end
  
  def hi
    redirect_to('index')
  end
  
  def lynda
    redirect_to("http://lynda.com")
  end
  
end
