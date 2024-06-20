<!-- src/components/Mask.svelte -->
<script>
  import { circleTransition } from '$lib/transitions/CircleTransition.js';
  import { showYoutubeTransition, videoId } from '$lib/stores/store.js';

  let thumbnailUrl;
  export let circleVisible = false;
  let range = 100;
  let circle;
</script>

<!--

{#if show}
  <div class="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center">
    
  </div>
{/if}
-->

<div class="container h-screen w-full">
  <!--<div class="inset-0 bg-transparent clip-path-circle"></div> -->

  <!--
<img src={thumbnailUrl} bind:this={thumbnail} alt="YouTube Video Thumbnail" />
-->

  <!--{#if showYoutubeTransition} -->
  <div
    class="clip top-0 h-screen w-screen bg-orange-500"
    style="--clip-range: circle({range * 0.1 + 100}% at center)"
    transition:circleTransition={{ duration: 1200, delay: 4000 }}
    bind:this={circle}
  >
    <slot />
  </div>
  <!-- {/if} -->
</div>

<style>
  .clip {
    clip-path: var(--clip-range);
  }

  .circle-mask {
    clip-path: circle(30%);
  }
</style>
