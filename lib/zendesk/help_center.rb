module Zendesk
  class HelpCenter < Article
    attr_accessor :response_body, :response_code

    def post_initialize(**args)
      @url = "#{URL}/help_center/#{@locale}/articles/#{@article_id}.json"
      @request = get_request
      @response_body = response_parse_body
      @response_code = request.response_code
    end

    def article_info
      {
        'help_articles' => {
          'id' => article_id,
          'title' => title,
          'content' => content
        }
      }
    end

    private

      def title
        response_code.eql?(200) ? response_body['article']['title'] : response_body['error']
      end

      def content
        response_code.eql?(200) ? change_content_html_safe : response_body['description']
      end

      def change_content_html_safe
        response_body['article']['body'].html_safe
      end
  end
end
