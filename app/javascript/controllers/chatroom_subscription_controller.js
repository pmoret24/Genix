import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number,
                    currentUserId: Number}
  static targets = ["messages"]
  connect() {
    console.log(this.currentUserIdValue)
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data.html, data.sender_id)}
    )
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  #insertMessageAndScrollDown(html, sender_id) {
    if(this.currentUserIdValue != sender_id) {
      html = html.replace("current-user", "other-user")
    }

    this.messagesTarget.insertAdjacentHTML("beforeend", html)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)

  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
