class MembersController < ApplicationController
  before_action :login_required

  #会員一覧
  def index
    @members = Member.order("number")
      .page(params[:page]).per(15)
  end

  def search
    @members = Member.search(params[:q])
    render "index"
      .page(params[:page]).per(15)
  end

  def show
    @member = Member.find(params[:id])
  end

  #新規作成フォーム
  def new
    @member = Member.new(birthday: Date.new(1980,1,1))
  end

  #更新フォーム
  def edit
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(member_params)
        if @member.save
          redirect_to @member, notice: "会員を登録しました。"
        else
          render "new"
        end
    end

  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(member_params)
    if @member.save
      redirect_to @member, notice: "会員情報を更新しました。"
    else
      render "edit"
  end
end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :members, notice: "会員情報を削除しました。"
end

  #ストロング・パラメータ
  private def member_params
    attrs = [
      :new_profile_picture,
      :remove_profile_picture,
      :number,
      :name,
      :full_name,
      :sex,
      :birthday,
      :email,
      :administrator
    ]

    attrs << :password if params[:action] == "create"

    params.require(:member).permit(attrs)
  end
end
