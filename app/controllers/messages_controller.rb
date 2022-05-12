class MessagesController < ApplicationController
  before_action :set_message, only: %i[destroy edit update]
  before_action :search, only: %i[index]

  def index
    @messages = @q.result(distinct: true)
  end

  def new
  end

  def create
    @message = Message.create!(message_params)
  end

  def destroy
    @message.destroy!
  end

   # 更新用のフォームに置き換えることだけに使用する
  def edit
  end

  def update
    @message.update!(message_params)
  end

  def search
    # params[:q]のqには検索フォームに入力した値が入る
   @q = Message.ransack(params[:q])
  end

  private

  # Strong Parameters はサボらずに使っておくこととします
  def message_params
    params.require(:message).permit(:content)
  end

  def set_message
    @message = Message.find(params[:id])
  end

end
