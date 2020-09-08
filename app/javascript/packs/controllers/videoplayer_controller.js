import { Controller } from 'stimulus'
import videojs from 'video.js'
import Rails from '@rails/ujs'

export default class extends Controller {
  static targets = [ "hashId" ]

  connect() {
    document.getElementById("");
    this.player = videojs("player", {
      controls: true,
      autoplay: true,
      fluid: true,
      preload: 'auto'
    });

    this.countViewWhenPlay();
  }

  countViewWhenPlay() {
    if(!window.location.pathname.includes('channels')) {
      this.player.on('play', () => { this.addView(); });
    }
  }

  addView() {
    Rails.ajax({
      type: "post",
      url: `${this.hashId.value}/add_view`
    })
  }

  get hashId() {
    return this.hashIdTarget;
  }

  disconnect() {
    this.player.dispose();
  }
}
