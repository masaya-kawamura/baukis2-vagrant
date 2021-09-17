class Admin::StaffMembersController < Admin::Base
  def index
    @staff_members = StaffMember.order(:family_name_kana, :given_name_kana)
  end

  def show
    staff_member = StaffMember.find(params[:id])
    # 配列の要素からリダ入れクション先が推定される。
    # edit_admin_staff_member_path(id: staff_member.id)
    redirect_to [ :edit, :admin, staff_member ]
  end

  def new
    @staff_member = StaffMember.new
  end

  def edit
    @staff_member = StaffMember.find(params[:id])
  end

  def create
    @staff_member = StaffMember.new(params[:staff_member])
    if @staff_member.save
      flash.notice = "職員アカウントを新規登録しました。"
      redirect_to :admin_staff_members
    else
      render action: "new"
    end
  end

  def update
    @staff_member = StaffMember.find(params[:id])
    # モデルオブジェクトの属性を一括設定。
    # @staff_member.attributes = params[:staff_member]と一緒
    @staff_member.assign_attributes(params[:staff_member])
    if @staff_member.save
      flash.notice = "職員アカウントを更新しました。"
      redirect_to :admin_staff_members
    else
      render action: "edit"
    end
  end

  def destroy
    staff_member = StaffMember.find(params[:id])
    # コールバックbefore_destroyがfalseを返した場合
    # 例外ActiveRecord::RecordNotDestroyedを発生させる
    staff_member.destroy!
    flash.notice = "職員アカウントを削除しました。"
    redirect_to :admin_staff_members
  end
end
