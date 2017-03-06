class AnswerController < ApplicationController
  def create
    @ask = Ask.find(params[:id])
  
    case request.method_symbol
      when :post
        answer = Answer.new
        answer.ask_id = params[:id].to_i
        answer.author = params[:author]
        answer.content = params[:content]
        answer.password = params[:password]
        answer.save
        @ask_id = params[:id].to_s
        redirect_to controller:'ask', action:'detail', id: @ask_id
    end
    
  end

  def update
    @answer = Answer.find(params[:id])
    @ask_id = params[:ask_id].to_s
    
    case request.method_symbol
      when :post
        if @answer.password != params[:password]
          @ask_id = params[:ask_id].to_s
          return redirect_to controller:'ask', action:'detail', id: @ask_id
        end
        @answer.author = params[:author]
        @answer.content = params[:content]
        @answer.save
        @ask_id = params[:ask_id].to_s
        redirect_to controller:'ask', action:'detail', id: @ask_id
    end
  end

  def delete
    @answer = Answer.find(params[:id])
    @ask_id = params[:ask_id].to_s
    
    case request.method_symbol
      when :post
        @ask_id = params[:ask_id].to_s
        
        if @answer.password != params[:password]
          return redirect_to controller:'ask', action:'detail', id: @ask_id
        end
        
        @answer.destroy
        
        redirect_to controller:'ask', action:'detail', id: @ask_id
    end
  end
  
end
