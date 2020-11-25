class Api::CommentsController < Api::BaseController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :set_article, only: [:index, :create]

  # GET /articles/:article_id/comments
  def index
    @comments = @article.comments

    render json: @comments
  end

  # GET /articles/:article_id/comments/:id
  def show
    render json: @comment
  end

  # POST /articles/:article_id/comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: api_article_comment_url(@article, @comment)
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/:article_id/comments/:id
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/:article_id/comments/:id
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_article
      @article = Article.find(params[:article_id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:content).merge(params.permit(:article_id).merge({ user_id: current_user.id}))
    end
end
