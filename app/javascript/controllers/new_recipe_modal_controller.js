import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  exitModalClick = (event) => {
    if (event.target == this.element) {
      this.element.style.display = "none";
      window.removeEventListener("click", this.exitModalClick);
    }
  }

  open() {
    this.element.style.display = "block";
    window.addEventListener("click", this.exitModalClick);
  }
}
