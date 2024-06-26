<!-- src/components/Mask.svelte -->
<script>
  import { circleTransition } from '$lib/transitions/CircleTransition.js';
  import { showYoutubeTransition, videoId, isPlayerReady } from '$lib/stores/store.js';

  let status = 'waiting...'
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
<div class="fixed inset-0 flex items-center justify-center z-10">
  <span class="text-xl text-black">isPlayerReady: {$isPlayerReady}</span>
</div>

<!--<div class="container h-screen w-full z-5">-->
  <!--<div class="inset-0 bg-transparent clip-path-circle"></div> -->

  <!--
<img src={thumbnailUrl} bind:this={thumbnail} alt="YouTube Video Thumbnail" />
-->

  <!--{#if showYoutubeTransition} -->
  <div
    class="clip top-0 h-screen w-screen bg-orange-500"
    style="--clip-range: circle({range * 0.1 + 100}% at center)"
    transition:circleTransition={{ duration: 1500, delay: 4000 }}
    bind:this={circle}
    on:introstart={() => (status = 'intro started')}
		on:outrostart={() => (status = 'outro started')}
		on:introend={() => (isPlayerReady.set(true))}
		on:outroend={() => (status = 'outro ended')}
  >
    <slot />
  </div>
  <!-- {/if} -->
<!--</div>-->

<style>
  .clip {
    clip-path: var(--clip-range);
  }

  .circle-mask {
    clip-path: circle(30%);
  }
</style>
