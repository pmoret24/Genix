import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="highlight"
export default class extends Controller {
  static targets = ["pitches", "projects", "connect", "about"]
  connect() {
    console.log(this.pitchesTarget.scrollHeight);

  }

  scrollHome() {
    // console.log("uhuumm estamos scrolando");
    // console.log(this.pitchesTarget.height);
    // console.log(window.scrollY);
    if (window.scrollY > 390 && window.scrollY < 900) {
      this.pitchesTarget.classList.add("highlight-pitches");
      this.projectsTarget.classList.remove("highlight-projects");
      this.connectTarget.classList.remove("highlight-connect");
      this.aboutTarget.classList.remove("highlight-about");
    } else if (window.scrollY > 900 && window.scrollY < 1300) {
      this.projectsTarget.classList.add("highlight-projects");
      this.connectTarget.classList.remove("highlight-connect");
      this.aboutTarget.classList.remove("highlight-about");
      this.pitchesTarget.classList.remove("highlight-pitches");

    }else if (window.scrollY > 1300 && window.scrollY < 1375){
      this.projectsTarget.classList.remove("highlight-projects");
      this.connectTarget.classList.add("highlight-connect");
      this.aboutTarget.classList.remove("highlight-about");
      this.pitchesTarget.classList.remove("highlight-pitches");

    }else if (window.scrollY > 1350 ){
      this.projectsTarget.classList.remove("highlight-projects");
      this.connectTarget.classList.remove("highlight-connect");
      this.aboutTarget.classList.add("highlight-about");
      this.pitchesTarget.classList.remove("highlight-pitches");

    }

  }
}
