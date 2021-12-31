class ApplicationController < ActionController::Base
  before_action :get_stories, except: [:favorites, :item]
  before_action :get_story, only: [:item]
  
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

  def item
    render({:template => "application/index"})
  end
  
  def get_story
    item_id = params[:item_id]
    url = "https://node-hnapi.herokuapp.com/item/#{item_id}"
    raw_story = open(url).read
    @parsed_story = JSON.parse(raw_story)
    @hasComments = @parsed_story["comments"].count > 0
    @comments = @hasComments ? @parsed_story["comments"] : 'No comments'
    @json_comments = @comments.to_json
    
    #if @hasComments
    #  @comments.each do |comment| 
    #    hasNestedComments = comment["comments"].length > 0
    #    if hasNestedComments
             # 
    #    comment["comments"].each do |nested_comment|
    #      @comments += nested_comment
    #    end
    #  end 
    #end

  end

  def get_stories
    isHomeRoute = request.path == '/'
    isNewRoute = request.path == '/new'
    
    if isHomeRoute 
      path = '/news'
    elsif isNewRoute
      path = '/newest'
    else
      path = request.path
    end 
      
    url = "https://node-hnapi.herokuapp.com#{path}"
    hasStories = open(url).read.length > 0
    raw_stories = hasStories ? open(url).read : 'No stories'
    @parsed_stories = JSON.parse(raw_stories)
  end

end
