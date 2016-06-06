module Api
  module V1
    class LinksController < ApiController
      respond_to :json

      def index
        respond_with Link.all
      end

      def create
        link = Link.new(link_params)

        if link.save
          render json: link
        else
          respond_with "Invalid url"
        end
      end

      def destroy
        render json: Link.destroy(params[:id])
      end

      def update
        link = Link.update(params["id"], link_params)
        binding.pry
        if link.save
          render json: link
        else
          respond_with "Invalid url"
        end
      end

      private

      def link_params
        params.require(:link).permit(:title, :url, :read)
      end
    end
  end
end
