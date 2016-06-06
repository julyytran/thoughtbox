module Api
  module V1
    class LinksController < ApiController
      respond_to :json

      def index
        respond_with Link.all
      end

      def create
        render json: Link.create(link_params)
      end

      def destroy
        render json: Link.destroy(params[:id])
      end

      def update
        render json: Link.update(params["id"], link_params)
      end

      private

      def link_params
        params.require(:idea).permit(:title, :url, :read)
      end
    end
  end
end
