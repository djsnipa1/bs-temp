<script>
  import { VideoPosition } from '$lib';
  import { Controls, YoutubeVideo } from '$lib';
  import { isControlsOpen } from '$lib/stores/ControlsStore.js';
  import { browser } from '$app/environment';
  import { onMount, onDestroy } from 'svelte';

   let element;

if (browser) {
   function centerElement() {
      const windowWidth = window.innerWidth;
      const elementWidth = element.offsetWidth;
      const leftPosition = (windowWidth - elementWidth) / 2;
      element.style.transform = `translateX(${leftPosition}px)`;
     console.log(leftPosition)
   }

   onMount(() => {
      window.addEventListener('resize', centerElement);
      centerElement();
   });

   onDestroy(() => {
      window.removeEventListener('resize', centerElement);
   });
  }
  
  // Apply the translation using CSS transform
  // element.style.transform = `translateX(${translation}px)`;

</script>

<YoutubeVideo />

<h1>{$isControlsOpen}</h1>

<button class="btn" on:click={() => { isControlsOpen.set(true); }}>
  Toggle Controls</button>

<!-- {#if $isControlsOpen} -->
<!-- <Controls style="top: 40px; left: 0; position: absolute; transform: translateX(290px);" /> -->
<div class="container z-[100] absolute" bind:this={element} 
   class:initialPosition={!$isControlsOpen} class:endPosition={$isControlsOpen}

>
  <Controls />
</div>
<!-- {/if} -->

<VideoPosition src="/beatstar-peru.mp4" />

<style>
  .initialPosition{
    transform: translateX(-290px);
    transition: all 1300ms ease-in;
  }
  .endPosition{
    transform: translateX(0px);
    transition: all 3500ms ease-out;
  }
</style>