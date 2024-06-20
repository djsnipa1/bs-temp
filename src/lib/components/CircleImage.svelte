<!-- src/components/CircleImage.svelte -->
<script>
import { circleTransition } from '$lib/transitions/CircleTransition.js';
import { showYoutubeTransition, videoId } from '$lib/stores/store.js';
import anime from 'animejs';
import { onMount } from 'svelte';


  let thumbnailUrl;
export let circleVisible = false;
  let range = 100;
  let circle, thumbnail;
  
  onMount(() => {
  //videoId = 'YOUR_VIDEO_ID'; // Replace with your video ID
    thumbnailUrl = `https://img.youtube.com/vi/${$videoId}/hqdefault.jpg`;
  
  
  
  let anim = () => {
	anime.timeline({ loop: false })
	.add({
  targets: thumbnail,
  //rotateY: '2160deg',
  rotateY: 360 * 5, 
  duration: 3000,
  translateZ: 0, // Keeps the circle in place while it rotates
  loop: false, // Makes the animation loop infinitely
  easing: 'easeInOutQuad' // Ensures the animation has a constant speed
})
.add({
  duration: 1000,
  loop: true,
  direction: 'alternate',
  update: function(anim){
    thumbnail.style.filter = 'blur(' + 20 * anim.progress / 100 + 'px)'
  }
})
}
anim()
})



  
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

<div class="container">


<img src={thumbnailUrl} bind:this={thumbnail} alt="YouTube Video Thumbnail" class="circle-mask object-cover absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 h-1/4 object-cover aspect-video" />

</div>
  <!--<div class="inset-0 bg-transparent clip-path-circle"></div> -->
  
<!--
<img src={thumbnailUrl} bind:this={thumbnail} alt="YouTube Video Thumbnail" />
-->




<style>
	  .clip {
    clip-path: var(--clip-range);
  }
  
 
  .circle-mask {
   clip-path: circle(30%);
  }
/*
.blur-shape {
 mask-image: radial-gradient(black 50%, rgba(0, 0, 0, 0.5) 50%));
}
.mask2 {
  mask-image: radial-gradient(circle, black 50%, rgba(0, 0, 0, 0.5) 50%);
}
*/
.mask3 {
 mask-image: radial-gradient(circle, black, transparent)
}
</style>