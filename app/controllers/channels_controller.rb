class ChannelsController < AuthenticatedController
  before_action :set_user_channel, except: [:new, :create]

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)

    if @channel.save!
      flash[:info] = "Seu canal foi criado!"
      redirect_to my_channel_path
    else
      flash[:error] = "Problemas ao criar o canal"
      render :new
    end
  end

  def show
    if @channel
      @videos = @channel.videos
    else
      redirect_to new_channel_path
    end
  end

  private

  def set_user_channel
    @channel = Channel.includes(:videos).find_by(user_id: current_user.id)
  end


  def channel_params
    params.require(:channel)
          .permit(:title)
          .merge(user_id: current_user.id)
  end
end
