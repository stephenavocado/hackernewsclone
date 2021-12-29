class ApplicationController < ActionController::Base
  def index
    render({:template => "application/index"})
  end
end
