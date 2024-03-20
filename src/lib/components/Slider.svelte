<script>
	import { cssPosition } from '$lib/stores/store.js';

	export let min = -33;
	export let max = 33;
	export let step = 3;
	export let value = 0;
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
