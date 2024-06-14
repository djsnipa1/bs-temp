<script>
    import { scale } from 'svelte/transition';
    import { quintOut } from 'svelte/easing';
    import { hideMainElements } from '$lib/stores/store.js';
    import { circleTransition } from '$lib/transitions/circleTransition.js';

let range = 100;
  

  

  let visible = true;
  let circleVisible = false;
  
  function woosh() {
    return {
      duration: 1000,
      easing: quintOut,
      css: (t, u) => `transform: scale(${t}) translateX(${u * 100}%)`
    }
  }
  
// here. 
/*
  import { cubicOut } from 'svelte/easing';

  function clipPathTransition(node, { duration }) {
    return {
      duration,
      css: t => {
        const eased = cubicOut(t);
          return `clip-path: circle(${eased * 100}% at center);`;
      }
    };
  }
  */
</script>


<div class="container">
<label>
  <input type="checkbox" bind:checked={circleVisible} />
  circleVisible
</label>




  <input type="range" bind:value={range} min="0" max="100" class="range range-primary w-1/2"/>

<p>{range}</p>

{#if circleVisible}
<div class="div-gradient-mask clip w-screen h-screen absolute t-0 bg-orange-500" style="--clip-range: circle({range}% at center)" transition:circleTransition>
  
</div>
{/if}
</div>

<label>
  <input type="checkbox" bind:checked={visible} />
  visible
</label>

{#if visible}
  <div
    class="centered bg-pink-500 h-40 w-20 rounded-full"
    transition:woosh
    
  >
    <span>transitions!</span>
  </div>
{/if}
<!-- 
{#if $hideMainElements}
<div class="mask-layer">
  <div class="circle-mask" in:scale={{ duration: 500, delay: 500, opacity: 1, start: 1, easing: quintOut }}></div>

  <p class="text-white font-xl">Hello, world!</p>
</div>
{/if}
-->

<!-- {#if !$hideMainElements}
  <div transition:scale={{ duration: 500, delay: 500, opacity: 0.5, start: 0.5, easing: quintOut }}>
    scales in and out
  </div>
{/if} -->

<style>

.div-gradient-mask {
  -webkit-mask-image: linear-gradient(to bottom, rgba(0,0,0,1), rgba(0,0,0,0));
  mask-image: linear-gradient(to bottom, rgba(0,0,0,1), rgba(0,0,0,0));
}

  .clip {
    clip-path: var(--clip-range);
  }
   .mask-layer {
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
      background-color: rgba(0, 0, 0, 0.8); /* Semi-transparent black */
      display: flex;
      justify-content: center;
      align-items: center;
      pointer-events: none; /* Allows clicks to pass through */
    }

   .circle-mask {
      position: absolute;
      width: 5%;
      height: 5%;
      border-radius: 50%;
      background-color: inherit;
     mask-size: contain;
     border: 2px solid blue;
      /* animation: expand 6s ease-out forwards; */
    }

    @keyframes expand {
      0% {
        clip-path: circle(0% at 50% 50%);
      }
      100% {
        clip-path: circle(125% at 50% 50%);
      }
    }
  </style>


