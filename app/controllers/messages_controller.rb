class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)#チャットルームに紐づいている全てのメッセージ（@room.messages)を@messagesと定義
  end                                         #この場合メッセージとユーザー情報の取得で二倍のアクセスが必要になるのでN＋1問題発生。そこでincludes使用して一回のアクセスにまとめる。
  
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index  #index.html.erb
    end  
  end

  
  
  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end  

end
