import { Controller } from "stimulus"

export default class extends Controller {
  change() {
    console.log(event.target.value)
  }
}