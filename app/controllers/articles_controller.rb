class ArticlesController < ApplicationController
   before_action :check_current_user, only: [:new, :create, :edit, :update, :destroy]
  def index
  	 @articles = Article.all.paginate(page: params[:page], per_page: 3)
     respond_to do |format|
        format.html
        format.csv { send_data @articles.to_csv }
        format.xls
        end
        # format.csv{ render text: @articles.to_csv}
        # format.xls { send_data @articles.to_csv(col_sep: "\t") }
     #@comments = @article.comments.order("id desc")
     #@comment = Comment.new
  end

  def new
  	@article = Article.new
  end

  def edit
  	@article=Article.find(params[:id])
  end
  def create
  @article = Article.new(article_params)
 
  if  @article.save
  	flash[:notice]="data successful save"
  redirect_to @article
  else
  	flash[:error]="data not valid"
  render 'new'
  end
  end
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end
  def update
  	@article=Article.find(params[:id])
  	if @article.update(article_params)
  		redirect_to @article
  	else
  		render 'edit'
  	end
  	
  end
  def destroy
  @article = Article.find(params[:id])
  if @article.destroy
  flash[:notice]="successful delete"
  redirect_to articles_path
  else
  flash[:error]="delete failed"
  redirect_to action: 'index'
  end
end
 
private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end

