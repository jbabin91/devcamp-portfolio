class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new    
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    # @portfolio_item = Portfolio.mew(portfolio_params)
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
    
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item was created.' }
        # form.json { render :show, status: :created, location: @portfolio_items }
      else
        format.html {render :new }
        # format.json { render json: @portfolio_items.errors, status: :unprocessable_entry }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update 
    @portfolio_item = Portfolio.find(params[:id])
    
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through
  # private
  #   def portfolio_params
  #     params.require(:portfolio).permit(:title, :subtitle, :body)
  #   end
  # end
end
