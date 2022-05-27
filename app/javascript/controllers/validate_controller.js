import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["validate", "container"]

  connect() {
    console.log(this.validateTarget)
  }

  displayPopup() {
    this.validateTarget.classList.add("active")
    this.containerTarget.classList.add("active")
  }

  hidePopup() {
    this.validateTarget.classList.remove("active")
  }
}
