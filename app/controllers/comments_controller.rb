class CommentsController < ApplicationController
    def create
        @requirement = Requirement.find(params[:requirement_id])
        @comment = @requirement.comments.build(content: params[:comment][:content], user: current_user)
        if @comment.save
            redirect_to root_path, notice: 'Comentario publicado'
          else
            redirect_to root_path, alert: 'Comentario no fue pulicado'
          end
      end 
end
