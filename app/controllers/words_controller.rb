class WordsController < ApplicationController
  def create
    @createWord = Word.new(word_params)
    @createWord.public_status = 0
    @createAddUser = AddUser.new(add_word_params)
    @createAddUser.word_id = @createWord.id
    @createAddUser.list_id = params[:id]
    if @createWord.create
      @createAddUser.create
      redirect_to edit_list_path
    else
      redirect_to edit_list_path
    end
  end

  def update
  end

  private

  def word_params
    params.require(:word).permit(:question, :answer, :description, :public_status)
  end

  def add_word_params
    params.require(:add_word).permit(:list_id, :word_id)
  end
end