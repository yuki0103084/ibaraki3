class CommentsController < ApplicationController
    def create
        comment = Comment.create(comment_params)
        redirect_to "/articles/#{comment.article.id}"
      end

      def destroy
        Comment.find_by(id: params[:id],article_id: params[:article_id]).destroy
        redirect_back(fallback_location: root_path)
      end
    
    
      private
      def comment_params
        params.require(:comment).permit(:text).merge(user_id: current_user.id, article_id: params[:article_id])
      end
    
end