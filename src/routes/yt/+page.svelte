<script>
	// import Youtube from '$lib/components/YoutubeNew.svelte';
import { Youtube, InputBoxNew } from '$lib';
  
	let player;

	const toggle = () => {
		console.log('changing video id');
		player.loadVideoById('dQw4w9WgXcQ');
	};
</script>

<div class="container z-[500]">
<InputBoxNew />
</div>
<Youtube bind:player />

<button class="btn button" on:click={toggle}>change video</button>



<div class="mockup-code">
  <pre><code>https://m.youtube.com/watch?v=m_xoN8KlP3w</code></pre>
</div>