import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("popover funcionando ");
    new bootstrap.Popover(this.element)
  }
}
