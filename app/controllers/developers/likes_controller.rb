module Developers
  class LikesController < ApplicationController
    before_action :authenticate_user!, only: %i[new create destroy]

    def show
      @business = current_user.business
      @like = @business.likes.find_or_initialize_by(
        prompt_response_id: params[:prompt_response_id]
      )
    end

    def create
      @business = current_user.business
      @like = @business.likes.build(response_params)

      if @like.save
        redirect_to like_path(prompt_response_id: @like.prompt_response.id)
      else
        render "show", status: :unprocessable_entity
      end
    end

    def destroy
      @business = current_user.business
      @like = Developers::Like.find_by(prompt_response_id: response_params[:prompt_response_id], business_id: @business.id)
      @like.destroy

      redirect_to like_path(prompt_response_id: @like.prompt_response.id)
    end

    private

    def response_params
      params.require(:developers_like).permit(:prompt_response_id)
    end
  end
end
