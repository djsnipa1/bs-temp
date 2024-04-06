<script>
  import { viewportHeight, viewport } from '$lib/stores/ViewportSize.js';
  import { Viewport } from '$lib';
  import { browser } from '$app/environment';
  import { onMount } from 'svelte';
  import anime from 'animejs';
  import { scale } from 'svelte/transition';

  import { VideoPosition } from '$lib';

  let div1, div2, div3, divWidth, divHeight, scaleFinal, masked;
  let w, h;

  onMount(setup);

  const drawLine = (targets, opts) => ({
    targets,
    scale: 8,
    borderWidth: '5px',
    ...opts
  });

  function setup() {
    anime
      .timeline({
        easing: 'easeOutExpo',
        autoplay: true,
        loop: true
      })
      .add(drawLine(div1, { duration: 2000, opacity: 100 }), 250)
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
      )
      .add(
        {
          targets: masked,
          scale: 8,
          duration: 2000,
          keyframes: [
            { clipPath: 'circle(0%)' }, // start frame
            { clipPath: 'circle(200%)' } // end frame
          ]
        },
        500
      );
  }
</script>

<div
  class="background flex min-h-full min-w-full items-center justify-center bg-gray-800"
>
  <Viewport />

  <div class="masked-component" id="masked" bind:this={masked}>
    <p>Content to be animated and masked</p>
    <VideoPosition src="/beatstar-peru.mp4" />
  </div>

  <div
    id="div1"
    bind:this={div1}
    bind:clientWidth={divWidth}
    bind:clientHeight={divHeight}
    class="border-1 absolute mx-auto h-20 w-20 rounded-[100%] border-amber-500 opacity-0"
  ></div>
  <div
    id="div2"
    bind:this={div2}
    class="border-1 absolute mx-auto h-20 w-20 rounded-[100%] border-white opacity-0"
  ></div>
  <div
    id="div3"
    bind:this={div3}
    class="border-1 absolute mx-auto h-20 w-20 rounded-[100%] border-pink-400 opacity-0"
  ></div>
</div>

<style>
  .masked-component {
    width: 200px;
    height: 200px;
    background-color: aqua;
    /* Example masking using clip-path */
    clip-path: circle(50%);
  }
  .box {
    clip-path: circle(75%);
    transition: clip-path 1s;
  }

  .box:hover {
    clip-path: circle(25%);
  }
</style>
