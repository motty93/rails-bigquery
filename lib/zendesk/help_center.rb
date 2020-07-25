module Zendesk
  class HelpCenter < Article
    attr_accessor :article

    def post_initialize(**args)
      @url = "#{URL}/help_center/#{@locale}/articles/#{@article_id}.json"
      @article = response_parse_body['article']
    end

    def article_info
      {
        'help_articles' => {
          'id' => article['id'],
          'title' => article['title'],
          'content' => article['body'].html_safe
        }
      }
    end
  end
end
