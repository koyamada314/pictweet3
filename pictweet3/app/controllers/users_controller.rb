class UsersController < ApplicationController
  
  #before_action :footprint_create, only: :show,unless: :footprint_create?

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
    @footprint = Footprint.find_or_create_by(visitor_id: current_user.id, host_id: params[:id])
    @footprint.touch

  end

  # def footprint_create
  #   render :nothing => true
  #   user = User.find(params[:id])
  #   unless user.id == current_user.id    #自分以外を訪問した時に、という条件分岐
  #     Footprint.create(visitor_id: current_user.id, host_id: user.id)     #足跡レコードをクリエイト。訪問された側、つまりhost_idのカラムに訪問先のユーザーのidを放り込む。host_idは本来、'host_id: params[:id]'となるがメソッドの一行目で指定されているのでuser.idで訪問先のidを取れる。
  #   end
  #    redirect_to action: 'show'
  # end

  def visiting      #自分が訪問している、つまり自分から見たhost側を取り出す
    @user = current_user
    @users = @user.hosts
  end

  def visitors      #自分に対する訪問者、つまり自分から見たvisitor側を取り出す
    @user = current_user
    @users = @user.visitors
  end

end

