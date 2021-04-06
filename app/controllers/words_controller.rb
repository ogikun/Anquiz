class WordsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @createWord = Word.new
    @words = @list.words
    createWord = Word.new(word_params)
    createWord.public_status = 0
    createWord.user_id = current_user.id
    createWord.list_id = params[:list_id]
    createWord.save
  end

  def destroy
    @list = List.find(params[:list_id])
    @createWord = Word.new
    @words = @list.words
    word = Word.find(params[:id])
    word.destroy
  end

  def update
    @list = List.find(params[:list_id])
    @createWord = Word.new
    @words = @list.words
    createword = Word.find(params[:id])
    createword.update(word_params)
  end

  private

  def word_params
    params.require(:word).permit(:question, :answer, :description, :public_status)
  end
end