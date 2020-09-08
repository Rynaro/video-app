class Channels::VideosController < AuthenticatedController

  before_action :set_channel, except: [:show]

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)

    if @video.save!
      flash[:info] = "Seu vídeo foi criado!"
      redirect_to my_channel_url
    else
      flash[:warning] = "Problemas ao salvar o vídeo"
      render :new
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update(video_params)
      flash[:info] = "Seu vídeo foi atualizado!"
      redirect_to my_channel_path
    else
      flash[:warning] = "Problemas ao salvar o vídeo"
      render :edit
    end
  end

  def destroy
    @video = Video.find(params[:id])
    if @video.destroy
      flash[:info] = "Seu vídeo foi removido!"
    else
      flash[:warning] = "Problemas ao remover o vídeo"
    end
    redirect_to my_channel_path
  end

  private

  def set_channel
    @channel = Channel.friendly.find(params[:channel_id])
  end

  def video_params
    params.require(:video)
          .permit(:title, :status, :thumbnail, :video)
          .merge({ channel_id: @channel.id })
  end
end
