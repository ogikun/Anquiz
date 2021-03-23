class WordsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @createWord = Word.new
    @words = @list.words
    createWord = Word.new(params_word)
    createWord.public_status = 0
    createWord.user_id = current_user.id
    createWord.save
    AddWord.create(list_id: params[:list_id], word_id: createWord.id)
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
    createword.update(params_word)
  end

  private

  def params_word
    params.require(:word).permit(:question, :answer, :description, :public_status)
  end
end