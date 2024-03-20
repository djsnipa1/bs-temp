<script>
	import { YoutubeNewer, InputBoxNew, ControlsNew } from '$lib';
	import { videoId } from '$lib/stores/YoutubeURL.js';
	import { copy } from 'svelte-copy';
	import { cssPosition } from '$lib/stores/store.js';

	let player;

	// const toggle = () => {
	// 	console.log('changing video id');
	// 	// player.loadVideoById('dQw4w9WgXcQ');
	// 	player.loadVideoById($videoId);
	// };

	// Reactive statement to load a new video when $videoId changes
	$: if ($videoId && player && typeof player.loadVideoById === 'function') {
		player.loadVideoById($videoId);
	}

	export let min = -33;
	export let max = 33;
	export let step = 3;
	export let value = 0;

	let style = '';

	$: style = `width: ${value}vw; height: ${value}px;`;
</script>

<input
	type="range"
	class="justify-items range mx-auto flex w-1/2 [--range-shdw:chartreuse]"
	{min}
	{max}
	{step}
	bind:value={$cssPosition}
/>
<div class="mx-auto w-1/2 text-2xl text-white">{$cssPosition}</div>

<div class="container z-[500]">
	<!-- <ControlsNew /> -->

	<InputBoxNew />

	<YoutubeNewer bind:player />
</div>

<div class="justify-items container">
	<button
		class="tooltip tooltip-left absolute right-4 z-[40] m-2 rounded-md bg-slate-600 p-2 text-slate-300 shadow-sm hover:bg-amber-500"
		data-tip="copied!"
		use:copy={'https://m.youtube.com/watch?v=9B1SQX9a_hU'}
	>
		<svg
			xmlns="http://www.w3.org/2000/svg"
			width="1em"
			height="1em"
			viewBox="0 0 24 24"
			{...$$props}
			><path
				fill="currentColor"
				d="M5.503 4.627L5.5 6.75v10.504a3.25 3.25 0 0 0 3.25 3.25h8.616a2.251 2.251 0 0 1-2.122 1.5H8.75A4.75 4.75 0 0 1 4 17.254V6.75c0-.98.627-1.815 1.503-2.123M17.75 2A2.25 2.25 0 0 1 20 4.25v13a2.25 2.25 0 0 1-2.25 2.25h-9a2.25 2.25 0 0 1-2.25-2.25v-13A2.25 2.25 0 0 1 8.75 2zm0 1.5h-9a.75.75 0 0 0-.75.75v13c0 .414.336.75.75.75h9a.75.75 0 0 0 .75-.75v-13a.75.75 0 0 0-.75-.75"
			/></svg
		>
	</button>

	<div class="mockup-code m-4 bg-slate-900 text-xs">
		<pre><code>https://m.youtube.com/watch?v=9B1SQX9a_hU</code></pre>
	</div>
</div>

<style>
	:root {
		/*
	range 
  --filler-size: 200px;
  --filler-offset: 2rem;
  --range-shdw: red;
*/
	}
</style>
