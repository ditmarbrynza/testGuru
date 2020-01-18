class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show destroy edit]

  def index
    @badges = Badge.all
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badge_url(@badge), notice: t('.success')
    else
      render :new
    end
  end

  def show

  end

  def new
    @badge = Badge.new
  end

  def edit
    
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image_url, :condition)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

end