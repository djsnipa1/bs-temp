<script>
  import { browser } from '$app/environment';
  /* 

  Important get brightness code

  */

  /* The element we wish to work on */
 // const header = document.getElementById("header");
  let header;

  
if (browser) {
  function getImageBrightness(imageSrc, callback) {
    let img = document.createElement("img");
    img.src = imageSrc;
    img.style.display = "none";
    img.crossOrigin = "anonymous";
    document.body.appendChild(img);

    let colorSum = 0;

    img.onload = function() {
      // create canvas
      let canvas = document.createElement("canvas");
      canvas.width = this.width;
      canvas.height = this.height;

      let ctx = canvas.getContext("2d");
      ctx.drawImage(this, 0, 0);

      let imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
      let data = imageData.data;
      let r, g, b, avg;

      for (var x = 0, len = data.length; x < len; x += 4) {
        r = data[x];
        g = data[x + 1];
        b = data[x + 2];

        avg = Math.floor((r + g + b) / 3);
        colorSum += avg;
      }

      let brightness = Math.floor(colorSum / (this.width * this.height));
      callback(brightness);
    }
  }


  
  /* To get the background image. Get style and then background image with a slice to remove quotes */
 // var imageElement = document.getElementById('header'),

    let imageElement = header,
    style = imageElement.currentStyle || window.getComputedStyle(imageElement, false),
    backgroundImage = style.backgroundImage.slice(4, -1).replace(/"/g, "");



  getImageBrightness(backgroundImage, function(brightness) {
    /* Remove dark and light classes from the element */
    header.classList.remove("dark");
    header.classList.remove("light");

    /* check brightness and apply correct style */
    /* Please modify the below brightness comparison statement to adjust to your needs */
    if (brightness > 225 / 2) {
      header.classList.toggle("dark");

    } else {
      header.classList.toggle("light");
    }
  });
}
</script>

 <div id="header" bind:this={header}>
    <h1>
      Header
    </h1>
 </div>

<style>
  .dark {
    color: black;
  }

  .light {
    color: white;
  }

  * {
    text-align: center;
  }

  #header {
    padding: 2rem 0;
    font-size: 4rem;
    background-size: cover;
    margin-bottom: 1rem;
    background-position: center center;
    background-image: url('https://images.unsplash.com/photo-1530128118208-89f6ce02b37b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80')
  }
 </style>