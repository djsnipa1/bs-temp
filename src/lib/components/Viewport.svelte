<script>
	import { viewportWidth, viewportHeight, viewport } from '$lib/stores/ViewportSize.js';

	let innerWidth = 0;
	let innerHeight = 0;
	viewportWidth.set(innerWidth);
	viewportHeight.set(innerHeight);

	viewport.set({
		width: innerWidth,
		height: innerHeight
	});
</script>

<svelte:window bind:innerWidth bind:innerHeight />

{@debug innerWidth}
{@debug innerHeight}
