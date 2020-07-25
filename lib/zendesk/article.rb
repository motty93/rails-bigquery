module Zendesk
  class Article
    attr_reader :article_id, :locale
    attr_accessor :url
    URL = "https://#{ENV['SUB_DOMAIN']}.zendesk.com/api/v2"

    def initialize(**args)
      @locale = args[:locale] || 'ja'
      @article_id = args[:article_id]
      @url = args[:url] || URL

      post_initialize(**args)
    end

    def post_initialize(**args)
      nil
    end

    private

      def response_parse_body
        JSON.parse(get_request.response_body)
      end

      def get_request
        Typhoeus::Request.get(url)
      end
  end
end
