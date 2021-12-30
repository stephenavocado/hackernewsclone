class ApplicationController < ActionController::Base
  before_action :get_stories
  
  def index
    render({:template => "application/index"})
  end

  def new
  end

  def ask
  end

  def show
  end

  def favorites
  end

  def get_stories
    isHomeRoute = request.path == '/'
    isNewRoute = request.path == '/new'
    
    if isHomeRoute 
      path = '/news'
    elsif isNewRoute
      path = 'newest'
    else
      path = request.path
    end 
      
    url = "https://node-hnapi.herokuapp.com#{path}"
    @raw_data = open(url).read
  end

end
