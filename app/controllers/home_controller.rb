class HomeController < ApplicationController
  def index
# @message = Gitlab.projects(per_page: 5)
    HelloJob.perform_async
    puts 123
  end
end
