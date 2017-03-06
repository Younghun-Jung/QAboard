class AskController < ApplicationController
  def create
    case request.method_symbol
      when :post
        ask = Ask.new
        ask.author = params[:author]
        ask.image = params[:image]
        ask.content = params[:content]
        ask.password = params[:password]
        ask.title = params[:title]
        ask.save
        
        redirect_to controller:'ask', action:'list'
    end
  end

  def update
    @ask = Ask.find(params[:id])
    
    case request.method_symbol
      when :post
        
        if @ask.password != params[:password]
          return redirect_to controller:'ask', action:'list'
        end
        @ask.author = params[:author]
        @ask.content = params[:content]
        @ask.title = params[:title]
        @ask.save
         
        redirect_to controller:'ask', action:'list'
    end
  end

  def delete
    @ask = Ask.find(params[:id])
    @ask_id = params[:ask_id].to_s
    
    case request.method_symbol
      when :post
        
        if @ask.password != params[:password]
          return redirect_to controller:'ask', action:'list'
        end
        
        @ask.destroy
        
        redirect_to controller:'ask', action:'list'
    end
  end

  def list
    @asks = Ask.order(created_at: :desc).all
  end

  def detail
    id = params[:id]
    @ask = Ask.find(id)
    @answers = Answer.where(ask: @ask).all #Answer에는 ask_id가 있는데 왜 ask:??
  end
end
