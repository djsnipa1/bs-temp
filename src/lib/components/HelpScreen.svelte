<script>
import anime from 'animejs';
  import { browser } from '$app/environment';
 let maskPath, glassBg, helpTitle, arrow,
   helptext1, helptext2, helptext3;
  let wipeHover, glassFade = false

  function setup() {
    wipeHover = false;
    
    anime
      .timeline({
        easing: 'easeOutQuad',
        autoplay: true,
        loop: true
      })
      .add({
        targets: glassBg,
      //  opacity: [0, 1],
        // translateY: [30, 0],
//        scale: [0, 1],
        begin: function(anim) {
          glassFade = false;
         glassFade = true;
        },
        duration: 2000,
      })
      .add({
        targets: helpTitle,
        opacity: [0, 1],
        translateY: [30, 0],
        duration: 1000,
        delay: 200
      })
      .add({
        targets: '.help',
        opacity: [0, 1],
        translateX: [50, 0],
        duration: 1000,
        delay: anime.stagger(350),
        easing: 'easeOutExpo'
      })
    .add({
      targets: arrow,
      duration: 1500,
      complete: function(anim) {
        wipeHover = true;
      }
    })
/*      .add(drawLine(div1, { duration: 2000, opacity: 100 }), 250)
      .add(drawLine(div2, { duration: 2000, opacity: 100 }), 750)
      .add(
        {
          targets: div3,
          scale: 8,
          borderWidth: 5,
          duration: 4000,
          opacity: 100
        },
        0
      );
      */
  }

  if (browser) {
    setup()
/*
    setTimeout(() => {
      setup()
      wipeHover = true
      console.log("myVariable is now true:"); // Optional: Log the updated value
    }, 8000); // 4000 milliseconds = 4 seconds

*/

    
  /*
  anime({
    targets: maskPath,
    autoplay: true,
    strokeDashoffset: [anime.setDashoffset, 0],
    easing: 'easeInOutSine',
    duration: 3000,
    direction: 'alternate',
    loop: true,
    delay: 3000,
    begin: function(anim) {
      maskPath.setAttribute("stroke", "red");
      maskPath.setAttribute("fill", "none");
    },
    complete: function(anim) {
      wipeHover = true;
    }
  });
  */
  }
  
</script>

<!-- <div class="min-w-full min-h-screen flex flex-col items-center justify-center"> -->

<div class="min-h-screen flex flex-col items-center justify-center relative overflow-hidden">
  
  <div class="glass border-2 border-red-500 relative  rounded-md max-w-full mx-4 px-4 top-0 shadow-xl shadow-slate-700/10 ring-1 ring-gray-900/5 {glassFade ? 'puff-in-center' : ''}" bind:this={glassBg}>
    <h1 class="text-center text-slate-700 text-2xl font-kiona" bind:this={helpTitle}>Help</h1>
    <div class="prose prose-slate border-2 border-green-500 mx-auto prose-sm font-sofiasans text-slate-700">
<ol class="list-decimal list-outside marker:text-slate-700 border-yellow-500 border">
  <li class="border-blue-500 border">
      <p class="m-0 p-0 help" bind:this={helptext1}>Find a YouTube video of your favorite streamer getting a Diamond Perfect on the song you would like to practice. </p>
  </li>
  <li>
      <p class="m-0 p-0 help" bind:this={helptext2}>Copy the URL of the video and paste it in the box above. (If you just want to see how this works you can click this copy button and it will automatically copy a URL for you to check out).</p>
  </li>
  <li>
      <p class="m-0 p-0 help" bind:this={helptext3}>When the video player controls appear, click play!</p>
  </li>
</ol>
      
    </div>
<div class="fixed top-16 right-6">
    <svg xmlns="http://www.w3.org/2000/svg" width="48.44" height="265.426" viewBox="699.152 987.033 48.44 265.426" style="transform: scale(0.9)" class="gradient {!wipeHover ? 'gradientHover' : ''}" bind:this={arrow}>
      <path bind:this={maskPath} id="mask-path"  stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="1" d="m717.524 995.254 18.95 6.785-14.737 10.665c64.754 91.093-12.532 238.678-12.532 238.678.123 1.398-4.694-.045-5.82.635 4.602-8.92 75.882-150.354 13.715-235.576l-12.282 10.417-2.067-20.021-3.6-19.804zm-14.37 257.206a.439.439 0 0 1 .231-.443l-.23.443z" font-family="none" font-size="none" font-weight="none" text-anchor="none"/>
    </svg>
</div>

    
  </div>

</div>

<style>
  @property --wipe-position {
    syntax: "<percentage>";
    inherits: false;
    initial-value: 100%;
  }
  :root {
     --wipe-position: 100%;
    --gradient-length: 20%;
  }
  .Mask {
    mask-image: linear-gradient(black 25%, transparent 50%);
}

  .wipe {
    -webkit-mask-image: linear-gradient(
      to bottom right,
      black var(--wipe-position),
      transparent calc(var(--wipe-position) + var(--gradient-length)),
      transparent
    );

    transition: --wipe-position 600ms cubic-bezier(0, 0.55, 0.45, 1);
  }

  .wipeHover {
    --wipe-position: calc(-1 * var(--gradient-length));
  }

  .gradient {
 /*   mask-image: linear-gradient(to bottom, black 55%, rgba(0, 0, 0, 0.01) 90%);  */
    mask-image: linear-gradient(
      to top,
      black var(--wipe-position),
      transparent calc(var(--wipe-position) + var(--gradient-length)),
      transparent
    );
    transition: --wipe-position 1600ms cubic-bezier(0, 0.55, 0.45, 1);
  }

  .gradientHover {
    --wipe-position: calc(-1 * var(--gradient-length));
  }

  .fade-in-bck {
    animation: fade-in-bck 1.6s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
  }

  /* ----------------------------------------------
   * Generated by Animista on 2024-7-3 22:30:56
   * Licensed under FreeBSD License.
   * See http://animista.net/license for more info. 
   * w: http://animista.net, t: @cssanimista
   * ---------------------------------------------- */

  /**
   * ----------------------------------------
   * animation fade-in-bck
   * ----------------------------------------
   */
  @keyframes fade-in-bck {
    0% {
      transform: translateZ(80px), scale(120%);
      opacity: 0;
    }
    100% {
      transform: translateZ(0);
      opacity: 1;
    }
  }

  .puff-in-center {
    animation: puff-in-center 0.7s cubic-bezier(0.470, 0.000, 0.745, 0.715) both;
  }

  /* ----------------------------------------------
   * Generated by Animista on 2024-7-3 22:45:35
   * Licensed under FreeBSD License.
   * See http://animista.net/license for more info. 
   * w: http://animista.net, t: @cssanimista
   * ---------------------------------------------- */

  /**
   * ----------------------------------------
   * animation puff-in-center
   * ----------------------------------------
   */
  @keyframes puff-in-center {
    0% {
      transform: scale(1.2);
      filter: blur(8px);
      opacity: 0;
    }
    100% {
      transform: scale(1);
      filter: blur(0px);
      opacity: 1;
    }
  }

  
</style>
