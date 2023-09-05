class CommentsController < ApplicationController
  def create
    @pitch = Pitch.find(params[:pitch_id])
    @comment = Comment.new(comment_params)
    @comment.pitch = @pitch
    @comment.user = current_user

     if @comment.save
        redirect_to pitch_path(@pitch)
     else
        render "pitches/show", status: :unprocessable_entity
     end

  end

  private
  def comment_params
    params.require(:comment).permit(:content, :rating)
  end
end
