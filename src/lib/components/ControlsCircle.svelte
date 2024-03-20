<script>
	import { isControlsOpen } from '$lib/stores/store.js';
	let isVisible = false;
</script>

<div
	class="translate glass fixed z-[100] h-[200px] w-[300px] rounded-xl border-2 border-gray-400 shadow-xl"
>
	<!-- class:visible={$isControlsOpen} class:notVisible={!$isControlsOpen} -->

	<button
		class="absolute right-4 top-2 text-red-500"
		on:click={() => {
			isControlsOpen.set(false);
		}}>X</button
	>
	<h1 class="text-center text-xl font-bold">Controls</h1>
	<div class="flex flex-col items-center justify-center">controls here</div>
</div>

<button class="btn" on:click={() => (isVisible = !isVisible)}>Toggle Visibility</button>

<!-- <div class:visibleDel={isVisible} class:notVisibleDel={!isVisible}>
  This div will move.
</div> -->

<style>
	.pos {
		top: 10px;
		right: 5px;
	}
	.visible {
		transform: translateX(50px);
		@apply transition-all;
	}
	.notVisible {
		/* transform: translateX(-290px); */
		@apply translate-x-4 transition-all;
	}
	.visibleDel {
		transform: translateX(-20px);
		@apply absolute top-0 h-10 w-10 bg-blue-400 transition-all;
	}
	.notVisibleDel {
		transform: translateX(0px);
		@apply absolute top-0 h-10 w-10 bg-blue-400 transition-all;
	}
</style>
