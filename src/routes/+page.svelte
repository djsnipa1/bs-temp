<script>
  import { VideoPosition } from '$lib';
  import { Controls } from '$lib';
  import { isControlsOpen } from '$lib/stores/store.js';
  import { browser } from '$app/environment';
  import { onMount, onDestroy, tick } from 'svelte';
  import { fly } from 'svelte/transition';
 import { goto } from '$app/navigation';

  let element, controlsContainer;
  let width;
  let innerWidth = 0;
  let innerHeight = 0;

  onMount(async () => {
    
    
    goto('/final');
    //await tick(); // wait for the next microtask
    //width = controlsContainer.clientWidth; // get the client width
  });

  let old = false;

  if (browser) {
    function centerElement() {
      const elementWidth = width;
      const leftPosition = (innerWidth - elementWidth) / 2;
      element.style.transform = `translateX(${leftPosition}px)`;
      console.log(leftPosition);
    }

    onMount(() => {
      window.addEventListener('resize', centerElement);
      centerElement();
    });

    onDestroy(() => {
      window.removeEventListener('resize', centerElement);
    });
  }
</script>

<svelte:window bind:innerWidth bind:innerHeight />

<!-- <h1>{$isControlsOpen}</h1> -->

<div
  id="links"
  class="fixed top-10 z-[6000] flex h-1/3 w-1/2 flex-col items-center justify-center rounded-lg border-2 border-yellow-500"
>
  <div
    class="grid grid-cols-1 divide-y divide-slate-600 rounded-lg bg-slate-500 p-2 shadow-lg"
  >
    <p class="py-2">
      <a href="/controls2" class="text-slate-200 hover:text-slate-700"
        >Controls2</a
      >
    </p>
    <p class="py-2">
      <a href="/controls" class="text-slate-200 hover:text-slate-700"
        >Controls</a
      >
    </p>
    <p class="py-2">
      <a href="/controlsnew" class="text-slate-200 hover:text-slate-700"
        >Controls New</a
      >
    </p>
    <p class="py-2">
      <a href="/css" class="text-slate-200 hover:text-slate-700">CSS</a>
    </p>
    <p class="py-2">
      <a href="/svg" class="text-slate-200 hover:text-slate-700">SVG</a>
    </p>
    <p class="py-2">
      <a href="/final" class="text-slate-200 hover:text-slate-700">Final</a>
    </p>
  </div>
</div>

<button
  class="btn"
  on:click={() => {
    isControlsOpen.set(true);
  }}
>
  Toggle Controls</button
>

<div bind:this={element}>
  that element has a width of {width}px
</div>

{#if old}
  <!-- <Controls style="top: 40px; left: 0; position: absolute; transform: translateX(290px);" /> -->
  <div
    class="container absolute z-[100]"
    class:initialPosition={!$isControlsOpen}
    class:endPosition={$isControlsOpen}
  >
    <Controls />
  </div>
{:else}
  <div class="absolute flex h-screen w-screen justify-center">
    <div
      class="container z-[100] mt-20 w-[300px]"
      bind:this={controlsContainer}
      class:initialPosition2={!$isControlsOpen}
      class:endPosition2={$isControlsOpen}
    >
      <Controls />
    </div>
  </div>
{/if}

<VideoPosition src="/beatstar-peru.mp4" />

<style>
  .initialPosition {
    transform: translateX(-290px);
    transition: all 2000ms ease-in;
  }
  .endPosition {
    transform: translateX(30px);
    /* transition: all 2000ms ease-out; */
    transition: all 2000ms cubic-bezier(0.25, 1, 0.5, 1);
  }
  .initialPosition2 {
    transform: rotateX(-100deg);
    transform-origin: top;
    border-radius: 10%;
    opacity: 0;
    transition: all 1.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  }
  .endPosition2 {
    transform: rotateX(0deg);
    transform-origin: top;
    border-radius: 50%;
    opacity: 1;
    transition: all 1.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  }
</style>
