class WordsController < ApplicationController
  def create
    createWord = Word.new(params_word)
    createWord.public_status = 0
    createWord.user_id = current_user.id
    createWord.save
    AddWord.create(list_id: params[:list_id], word_id: createWord.id)
    redirect_back fallback_location: root_path
  end

  def update
    @createword = Word.find(params[:id])
    @createword.update(params_word)
  end

  private

  def params_word
    params.require(:word).permit(:question, :answer, :description, :public_status)
  end
end