<script>
	import { VideoPosition } from '$lib';
	import { fade } from 'svelte/transition';
	let showComponent = false;
</script>

<button on:click={() => (showComponent = !showComponent)}> Toggle Component </button>

{#if showComponent}
	<div class="masked-component" in:fade={{ duration: 1000 }}>
		<p>Content to be animated and masked</p>
		<VideoPosition src="/beatstar-peru.mp4" />
	</div>
{/if}

<style>
	.masked-component {
		width: 200px;
		height: 200px;
		background-color: aqua;
		/* Example masking using clip-path */
		clip-path: circle(50% at 50% 50%);
	}
</style>
