class Api::ZendeskController < ApplicationController
  def show
    url = "https://#{ENV['SUB_DOMAIN']}.zendesk.com/api/v2/help_center/ja/articles/#{params[:id]}.json"
    req = Typhoeus::Request.get(url)
    response_body = JSON.parse(req.response_body)
    binding.pry
  end
end
