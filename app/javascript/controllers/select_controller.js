import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = []

  connect() {
    console.log("select controller 1 connected")

  }

  buttonDisabled() {
    var element = document.getElementById("picture2")
    console.log(element)
    element.style.display = "block"
  }



}
