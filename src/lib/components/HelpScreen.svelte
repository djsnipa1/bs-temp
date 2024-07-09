<script>
  import anime from "animejs";
  import {browser} from "$app/environment";
  import {blur} from "svelte/transition";
  import {cubicIn} from "svelte/easing";
  import { customFadeBlur } from '$lib/transitions/CustomFadeBlur.js';
  import { isUrlOpen } from '$lib/stores/store.js';
  
  let show = false;

  function handleClick() {
    show = !show;
   // setup();	
   isUrlOpen.set(false)
   startDelay();
  }
  
  let maskPath, glassBg, helpTitle, arrow, helpText1, helpText2, helpText3;
  let wipeHover,
    glassFade = false;
   
   
  function delayedFunction() {
    console.log('This runs after 1 second');
  }

  function startDelay() {
    setTimeout(setup, 100);
  }

function testthis() {
       animation2.play()
       wipeHover = true
     }


  function setup() {
    wipeHover = false;

  
    let animation = anime.timeline({
        easing: "easeOutQuad",
        autoplay: true,
        loop: false,
      })
  
  let animation2 = anime.timeline({
        easing: "easeOutQuad",
        autoplay: false,
        loop: false,
      })
      
      animation.add({
        targets: ".help-title",
        opacity: [0, 1],
        translateY: [30, 0],
        duration: 1000,
        easing: "easeInQuart",
    //    offset: "-=700",
        begin: () => {
          console.log("help start");
        },
        complete: () => {
          console.log("help end");
        },
      })
      animation.add({
        targets: ".help",
        opacity: [0, 1],
        translateX: [50, 0],
        duration: 700,
        delay: anime.stagger(350),
        easing: "easeInQuart",
        complete: function(anim) { 
        //  console.log("animation2") 
          animation2.play() 
        }
      })
     
    /* animation.finished.then(function() {
  console.log('finished')
  animation2.play()
});
     */
     
     
   /*  
      animation2.add({
        targets: arrow,
        duration: 1500,
        begin: () => {wipeHover = true}
      });
      animation2.add({
        targets: arrow,
        duration: 2000,
        translateY: [0, -30]
      })
      */
 
      animation2.add({
  targets: '.rectangle-reveal',
  clipPath: [
    { value: 'inset(100% 0% 0% 0%)' },
    { value: 'inset(0% 0% 0% 0%)' }
  ],
  duration: 2000
});

const helpBorder = '#eab308';
animation2.add({
       targets: helpText1,
       outlineColor: [
           { value: ['transparent', helpBorder], duration: 300 },
           //{ value: [helpBorder, 'transparent'], duration: 1000 },
           { value: '#fff', duration: 1000, delay: 1000 }
         ],
      // duration: 3000,
       easing: 'linear',
      // delay: 
     }) 
     /*
     animation2.add({
      targets: helpText1,
      outlineColor: {
       value: [helpBorder, 'transparent'],
       duration: 1000
      },
      delay: 1500
     })
*/
      animation.play()
    }
  

  if (browser) {
    //setup();
    startDelay();
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
      wipeHover = true;zz
    }dßz
  });
  */
  }
</script>

<!-- <div class="min-w-full min-h-screen flex flex-col items-center justify-center"> -->

<button class="btn absolute z-[5000] top-[300px]" on:click="{handleClick}"> toggle show
</button>


{#if show}
<div
  class="min-h-screen flex flex-col items-center justify-center relative overflow-hidden"
>

  <div
    class="glass border-2 border-red-500 relative rounded-md max-w-full mx-4 px-4 top-0 shadow-xl shadow-slate-700/10 ring-1 ring-gray-900/5"
    transition:customFadeBlur
  >
    <h1
      class="text-center text-slate-700 text-2xl font-kiona help-title"
      bind:this="{helpTitle}"
    >
      Help
    </h1>
    <div
      class="prose prose-slate border-2 border-green-500 mx-auto prose-sm font-sofiasans text-slate-700"
    >
      <ol
        class="list-decimal list-outside marker:text-slate-700 border-yellow-500 border"
      >
       <li class="border-blue-500 outline-4 outline outline-yellow-500/0 outside border-0 border-box" id="helpText1" bind:this="{helpText1}">
          <p class="m-0 p-0 help">
            Find a YouTube video of your favorite streamer getting a Diamond
            Perfect on the song you would like to practice.
          </p>
        </li>
        <li bind:this="{helpText2}">
          <p class="m-0 p-0 help">
            Copy the URL of the video and paste it in the box above. (If you
            just want to see how this works you can click this copy button and
            it will automatically copy a URL for you to check out).
          </p>
        </li>
        <li bind:this="{helpText3}">
          <p class="m-0 p-0 help">
            When the video player controls appear, click play!
          </p>
        </li>
      </ol>
    </div>
    <div class="absolute rectangle-reveal top-0 right-8 -translate-y-[4.5rem]">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="48.44"
        height="265.426"
        viewBox="699.152 987.033 48.44 265.426"
        style="transform: scale(0.8)"
        id="arrow"
        class="fill-slate-200 stroke-slate-700 stroke-2"
        
     >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-miterlimit="10" 
          d="m717.524 995.254 18.95 6.785-14.737 10.665c64.754 91.093-12.532 238.678-12.532 238.678.123 1.398-4.694-.045-5.82.635 4.602-8.92 75.882-150.354 13.715-235.576l-12.282 10.417-2.067-20.021-3.6-19.804zm-14.37 257.206a.439.439 0 0 1 .231-.443l-.23.443z"
        />
      </svg>
    </div>
  </div>
</div>
{/if}

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

/*
  .wipe {
    -webkit-mask-image: linear-gradient(
      to bottom right,
      black var(--wipe-position),
      transparent calc(var(--wipe-position) + var(--gradient-length)),
      transparent
    );

    transition: --wipe-position 600ms cubic-bezier(0, 0.55, 0.45, 1);
  }
  */

  .wipeHover {
    --wipe-position: calc(-1 * var(--gradient-length));
  }

  .gradient {
    opacity: 50%;
    /*   mask-image: linear-gradient(to bottom, black 55%, rgba(0, 0, 0, 0.01) 90%);  */
    mask-image: linear-gradient(
      to top,
      black var(--wipe-position),
      transparent calc(var(--wipe-position) + var(--gradient-length)),
      transparent
    );
    transition: --wipe-position 1600ms cubic-bezier(0, 0.55, 0.45, 1);
  }

  .gradient:hover, .gradientHover {
    --wipe-position: calc(-1 * var(--gradient-length));
  }


  .puff-in-center {
    animation: puff-in-center 1s cubic-bezier(0.5, 0, 0.75, 0) both;
  }

  
  .help,
  .help-title {
    opacity: 0;
  }
  
  .arrowMask {
  background-image: url('https://placehold.co/600x400.png');
  background-size: cover;
  position: absolute;
  height: 100%;
  width: 100%;
  mask-image: linear-gradient(black 25%, transparent 50%);
  mask-repeat: no-repeat;
  animation: botToTop 5s forwards;
}

@keyframes botToTop {
  0% {
    mask-position: 0vh 0%;
  }
  100% {
    mask-position: 100vh 0vh;
  }
}


/* New @keyframes for the infinite animation */
@keyframes wipeAnimation {
  0% {
    --wipe-position: 0;
  }
  50% {
    --wipe-position: calc(-1 * var(--gradient-length));
  }
  100% {
    --wipe-position: 0;
  }
}

/* Modified .wipe class to include the infinite animation */
.wipe {
  -webkit-mask-image: linear-gradient(
    to bottom right,
    black var(--wipe-position),
    transparent calc(var(--wipe-position) + var(--gradient-length)),
    transparent
  );
  /* Add the animation property here 
  animation: wipeAnimation 1200ms ease-in-out infinite;
  */
}

.rectangle-reveal {
  clip-path: inset(100% 0% 0% 0%); /* Initially clips the entire element */
/*  animation: reveal-up 1s ease-in-out forwards; */
}

/*
@keyframes reveal-up {
  from {
    clip-path: inset(100% 0% 0% 0%);
  }
  to {
    clip-path: inset(0% 0% 0% 0%); 
  }
}
*/

#helpText1 {
  box-shadow: 0 0 10px 5px rgba(255,255,0,0.6);
  @apply rounded-lg;
  
}


</style>
