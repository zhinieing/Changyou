var wrap = document.querySelectorAll(".wrap");
var tick = document.querySelectorAll(".tick");

for (var i = 0; i < wrap.length; i++) {
  wrap[i].addEventListener("click", function() {
    for (var j = 0; j < tick.length; j++) {
      this.querySelectorAll(".tick")[j].classList.toggle("checked");
    }
  }, false);
}
