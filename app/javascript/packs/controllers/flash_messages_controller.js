import { Controller } from 'stimulus'

export default class extends Controller {
  closeNotificationBox(event) {
    let notification = event.target.parentNode
    notification.parentNode.removeChild(notification);
  }

  addFlashMessage(event) {
    let content = this.data.get("content"),
        type    = this.data.get("type"),
        message = this.buildMessage(content, type),
        holder  = document.getElementById("flash-messages-holder")

    holder.appendChild(message)
  }

  buildMessage(content, type) {
    let message = document.createElement("div")
    message.classList.add("notification", "is-radiusless", "is-" + type)

    let closeButton = document.createElement("button")
    closeButton.classList.add("delete")
    closeButton.setAttribute('data-action', 'click->flash-messages#closeNotificationBox');

    message.appendChild(closeButton)

    let textNode = document.createTextNode(content);
    message.appendChild(textNode);

    return message
  }
}
