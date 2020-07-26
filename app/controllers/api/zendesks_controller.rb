class Api::ZendesksController < ApplicationController
  before_action :set_zendesk_help

  def show
    @info = @help_center.article_info.transform_keys { |key| key.to_s.camelize(:lower) }
  end

  private

    def set_zendesk_help
      @help_center = Zendesk::HelpCenter.new(**article_params)
    end

    def article_params
      {
        article_id: params[:id],
        locale: params[:locale]
      }
    end
end
