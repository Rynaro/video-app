class Discover::VideosController < AuthenticatedController

  def index
    @search = Video.ransack(params[:q])
    @videos = @search.result(distinct: true).order(:title).includes(:channel)
  end

  def show
    @video = Video.includes(:video_movements).find(params[:id])
    @related_videos = Video.related_by_channel(@video.channel_id, @video.id)
  end

  def add_view
    @video = Video.find(params[:id])
    @video.viewed_by(current_user.id) if @video
  end
end
