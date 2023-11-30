// document.addEventListener('DOMContentLoaded', function() {

//   // var btns = document.querySelectorAll('.btn'),
//   //     carousel = document.getElementById('carousel'),
//   //     increment = 40,
//   //     cur = 0;

//   var carousel = document.getElementById('carousel');
//   var increment = 40;

//   // Retrieve carousel state from local storage
//   var cur = localStorage.getItem('carouselRotation') || 0;
//   carousel.style.transform = `rotateY(${cur}deg)`;

//   var btns = document.querySelectorAll('.btn');

//   btns.forEach((btn)=>{
//     btn.addEventListener('click',function(){
//       if(this.textContent == 'prev') cur += increment;
//       else cur -= increment;
//       carousel.style.transform = `rotateY(${cur}deg)`;
//       localStorage.setItem('carouselRotation', cur);
//     });
//   });

// });
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["carousel", "container"];

  connect() {
    this.carouselTarget.style.transform = `rotateY(0deg)`;
    this.increment = 40;
    this.cur = 0;

    const btns = this.containerTarget.querySelectorAll('.btn');

    btns.forEach((btn) => {
      btn.addEventListener('click', (event) => {
        const direction = event.currentTarget.textContent;

        if (direction === 'prev') {
          this.cur += this.increment;
        } else {
          this.cur -= this.increment;
        }

        this.carouselTarget.style.transform = `rotateY(${this.cur}deg)`;
        localStorage.setItem('carouselRotation', this.cur);
      });
    });
  }
}
