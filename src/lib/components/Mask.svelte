<!-- src/components/Mask.svelte -->
<script>
import { circleTransition } from '$lib/transitions/CircleTransition.js';
import { showYoutubeTransition, videoId } from '$lib/stores/store.js';
import anime from 'animejs';

  import { onMount } from 'svelte';

  let thumbnailUrl;

  onMount(() => {
  //videoId = 'YOUR_VIDEO_ID'; // Replace with your video ID
    thumbnailUrl = `https://img.youtube.com/vi/${$videoId}/hqdefault.jpg`;
  });

  export let circleVisible = false;
  let range = 100;
  let circle;
  
  function spin() {
    anime({
  targets: circle,
  rotateY: {
    value: '+=720', duration: 3000
  },
  translateZ: 0, // Keeps the circle in place while it rotates
  duration: 4000, // Duration of the animation in milliseconds
  loop: true, // Makes the animation loop infinitely
  easing: 'linear' // Ensures the animation has a constant speed
});
console.log("spin")
  }
  
</script>

<!--

{#if show}
  <div class="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center">
    
  </div>
{/if}
-->

<div class="container w-full h-screen top-0">

<img src={thumbnailUrl} alt="YouTube Video Thumbnail" />

  <!--{#if showYoutubeTransition} -->
<div class="clip w-screen h-screen top-0 bg-orange-500" style="--clip-range: circle({range * 0.1 + 100}% at center)" transition:circleTransition={{duration: 2500, delay: 4000}} bind:this={circle}>
  <slot />
</div>
<!-- {/if} -->
</div>

<style>
	  .clip {
    clip-path: var(--clip-range);
  }
  
</style>