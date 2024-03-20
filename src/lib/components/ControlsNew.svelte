<script>
	import { isControlsOpen, cssPosition } from '$lib/stores/store.js';
	import { Slider } from '$lib';

	let isVisible = false;
</script>

<div class="container relative">
	<div
		class="glass absolute left-0 top-0 z-[100] z-[1500] h-[200px] min-w-full rounded-xl shadow-xl"
	>
		<!--	class:visible={$isControlsOpen} class:notVisible={!$isControlsOpen} -->

		<button
			class="bg-white-500/50 z-100 absolute right-2 top-2 h-8 w-8 border-2 border-blue-800 text-red-500"
			on:click={() => {
				isControlsOpen.set(false);
			}}>X</button
		>
		<h1 class="text-center text-xl font-bold mix-blend-difference font-sofiasans">Controls</h1>
		<div class="flex flex-col items-center justify-center font-sofiasans">controls here</div>

		<Slider />
	</div>
</div>

<!--<button class="btn" on:click={() => (isVisible = !isVisible)}>Toggle Visibility</button>-->

<!-- <div class:visibleDel={isVisible} class:notVisibleDel={!isVisible}>
  This div will move.
</div> -->

<style>
	.pos {
		top: 10px;
		right: 5px;
	}
	.initialPosition {
		transform: translateY(-180px);
	}
	.visible {
		transform: translateX(0px);
		@apply transition-all;
	}
	.notVisible {
		/* transform: translateY(-290px); */
		@apply -translate-x-[290px] transition-all;
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
