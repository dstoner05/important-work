const displayedImage = document.querySelector('.displayed-img');
const thumbBar = document.querySelector('.thumb-bar');
const btn = document.querySelector('button');
const overlay = document.querySelector('.overlay');


/* Looping through images */
x = 1
for (x; x <= 5; x++) {
    const newImage = document.createElement('img');
    newImage.setAttribute('src', 'images/image' + x + '.jpg');
    thumbBar.appendChild(newImage);
    newImage.onclick = function(e) {
        displayedImage.src = e.target.src;
    }
  }

/* Wiring up the Darken/Lighten button */
btn.onclick = function() {
    const btnClass = btn.getAttribute('class');
    if (btnClass === 'dark') {
        btn.setAttribute('class', 'light');
        btn.textContent = 'Lighten';
        overlay.style.backgroundColor = 'rgba(0,0,0,0.5)';
    } else {
        btn.setAttribute('class', 'dark');
        btn.innerHTML = 'Darken';
        overlay.style.backgroundColor = 'rgba(0,0,0,0)';
    }
}