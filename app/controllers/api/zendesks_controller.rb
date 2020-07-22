class Api::ZendesksController < ApplicationController
  def show
    url = "https://#{ENV['SUB_DOMAIN']}.zendesk.com/api/v2/help_center/ja/articles/#{params[:id]}.json"
    req = Typhoeus::Request.get(url)
    @article = JSON.parse(req.response_body)['article']
  end
end
