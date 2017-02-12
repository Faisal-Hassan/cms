class DemoController < ApplicationController
  
  layout false
  
  def index
    render('index')
  end
  
  def hello
    render(:action => 'index')
  end
  
  def hi
    redirect_to('index')
  end
  
  def lynda
    redirect_to("http://lynda.com")
  end
  
end
