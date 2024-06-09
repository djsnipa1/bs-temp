<script>
    import { scale } from 'svelte/transition';
    import { quintOut } from 'svelte/easing';
    import { hideMainElements } from '$lib/stores/store.js';

  function customTransition(node, { delay = 0, duration = 4000 }) {
    const o = +getComputedStyle(node).clipPath;

    return {
      delay,
      duration,
      css: (t) => `clip-path: circle(${t * o} at center);`
    };
  }

  let visible = true;
</script>

<label>
  <input type="checkbox" bind:checked={visible} />
  visible
</label>

{#if visible}
  <div
    class="centered"
    transition:customTransition={{ duration: 8000 }}
    
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


