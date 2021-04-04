import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["frame"]
  static values = { url: String }

  get_id(element) {

  }
  update() {
    if(event.target.id == "") {
      var element_id = event.target.closest('.col').id.split('_').pop()
    } else {
      var element_id = event.target.id.split('_').pop();
    }
    if (element_id == "n/a") {
      return;
    }
    var record_src = this.urlValue + element_id
    this.frameTarget.src=record_src
  
  }
}