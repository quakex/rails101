class PostsController < ApplicationController

  # 用befor_action 来重构重复的代码
  before_action :find_group


  def new
    @post = @group.posts.new
  end

  # 编辑 post，找到对应的post，显示出来，修改更新交给update动作
  def edit
    @post = @group.posts.find(params[:id])
  end

  # 更新action
  def update
    @post = @group.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to group_path(@group), notice: "文章修改成功！"
    else
      render :edit
    end
  end

  def create
    @post = @group.posts.new(post_params)

    if @post.save
      redirect_to group_path(@group), notice: "新增文章成功！"
    else
      render :new
    end
  end

  def destroy
    @post = @group.posts.find(params[:id])

    @post.destroy
    redirect_to group_path(@group), alert: "文章已经删除"
  end

  private

  def find_group
    @group = Group.find(params[:group_id])
  end
  def post_params
    params.require(:post).permit(:content)

  end
end
