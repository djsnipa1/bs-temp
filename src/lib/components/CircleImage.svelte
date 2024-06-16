<!-- src/components/Mask.svelte -->
<script>
  import { showYoutubeTransition, videoId } from '$lib/stores/store.js';
  import anime from 'animejs';
  import { onMount } from 'svelte';

  let thumbnailUrl;
  let range = 100;
  let circle, thumbnail;

  onMount(() => {
    //videoId = 'YOUR_VIDEO_ID'; // Replace with your video ID
    thumbnailUrl = `https://img.youtube.com/vi/${$videoId}/hqdefault.jpg`;

    let anim = () => {
      anime.timeline({ loop: true }).add({
        targets: thumbnail,
        rotateY: {
          value: '1080deg',
          duration: 2000
        },
        translateZ: 0, // Keeps the circle in place while it rotates
        loop: true, // Makes the animation loop infinitely
        easing: 'easeInQuad' // Ensures the animation has a constant speed
      });
    };
    anim();
  });

  /* 
  onMount(() => {
		console.log(image.clientHeight)
	let anim = () => {
	anime.timeline({ loop: true })
  .add({
    targets: "img",
    duration: 1200,
    height: 50,
    width: 225,
    elasticity: 200,
    borderRadius: 25,
    delay: 1000
  })
  .add({
    targets: "div",
    duration: 1800,
    height: 200,
    width: 200,
    borderRadius: 100,
    elasticity: 300
  })
		.add({
			targets: "img",
			width: 300,
			height: image.clientHeight,
			aspectRatio: "16/9",
			duration: 2000,
			elasticity: 600
		})
  .add({
    targets: "section",
    scale: 2,
		elasticity: 400,
    easing: "easeOutSine",
    duration: 700
  })
  .add({
    targets: "section",
    scale: 1,
		elasticity: 400,
    easing: "easeInSine",
    duration: 350
	})
  .add({
    targets: "div",
    height: 100,
    width: 100,
		elasticity: 50,
    borderRadius: "50%"
  })
		.add({
			targets: ["div", "img", "section"],
			rotateY: '1080deg',
			duration: 2000,
			easing: "easeOutQuint",
		delay: anime.stagger(400)
		})
	};
  anim();
	});
	*/
</script>

<!--

{#if show}
  <div class="fixed inset-0 bg-black bg-opacity-50 z-50 flex items-center justify-center">
    
  </div>
{/if}
-->

<div class="container h-screen w-full">
  <img
    src={thumbnailUrl}
    bind:this={thumbnail}
    alt="YouTube Video Thumbnail"
    class="circle-mask absolute left-1/2 top-1/2 aspect-video h-1/4 -translate-x-1/2 -translate-y-1/2 object-cover object-cover"
  />
  <!--<div class="inset-0 bg-transparent clip-path-circle"></div> -->

  <!--
<img src={thumbnailUrl} bind:this={thumbnail} alt="YouTube Video Thumbnail" />
-->

  <!--{#if showYoutubeTransition} -->
  <div
    class="clip top-0 h-screen w-screen bg-orange-500"
    style="--clip-range: circle({range * 0.1 + 100}% at center)"
    transition:circleTransition={{ duration: 1200, delay: 2000 }}
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
