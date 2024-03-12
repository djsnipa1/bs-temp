<script>
	import { isControlsOpen } from '$lib/stores/ControlsStore.js';
	let isVisible = false;
</script>

<div
		class="container absolute z-[100]"
		class:initialPosition={!$isControlsOpen}
		class:endPosition={$isControlsOpen}
	>
	
	
<div class="translate glass fixed z-[100] h-[200px] w-[300px] rounded-xl shadow-xl">
	<!-- class:visible={$isControlsOpen} class:notVisible={!$isControlsOpen} -->

	<button
		class="absolute right-4 top-2 text-red-500"
		on:click={() => {
			isControlsOpen.set(false);
		}}>X</button
	>
	<h1 class="text-center text-xl font-bold mix-blend-difference">Controls</h1>
	<div class="flex flex-col items-center justify-center">controls here</div>


  <input type="range" class="range [--range-shdw:chartreuse] w-1/2 mx-auto flex justify-items" {min} {max} {step} bind:value={$cssPosition} />
  <div class="text-2xl text-white">{$cssPosition}</div>
</div>
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
