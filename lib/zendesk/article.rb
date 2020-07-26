module Zendesk
  class Article
    attr_reader :article_id, :locale
    attr_accessor :url, :request
    URL = "https://#{ENV['SUB_DOMAIN']}.zendesk.com/api/v2"

    def initialize(**args)
      @locale = args[:locale] || 'ja'
      @article_id = args[:article_id]
      @url = args[:url] || URL
      @request = nil

      post_initialize(**args)
    end

    def post_initialize(**args)
      nil
    end

    private

      def response_parse_body
        return unless request.present?

        JSON.parse(request.response_body)
      end

      def get_request
        Typhoeus::Request.get(url)
      end
  end
end
