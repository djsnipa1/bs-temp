<script>
	import { writable } from 'svelte/store';
	import { isControlsOpen } from '$lib/stores/ControlsStore.js';
  let isVisible = false;
</script>

<div
	class="glass fixed z-[100] h-[200px] w-[300px] rounded-xl border-2 border-gray-400 shadow-xl"
  class:visible={isVisible} class:notVisible={!isVisible}
>
	<button
		class="absolute right-4 top-2 text-red-500"
		on:click={() => {
			isControlsOpen.set(false);
		}}>X</button
	>
	<h1 class="text-center text-xl font-bold">Controls</h1>
	<div class="flex flex-col items-center justify-center">controls here</div>
</div>

<!-- <div class:visibleDel={isVisible} class:notVisibleDel={!isVisible}>
  This div will move.
</div> -->

<style>
	.pos {
		top: 10px;
		right: 5px;
	}
  .visible {
    transform: translateX(0px);
    @apply transition-all;
  }
  .notVisible {
    transform: translateX(-200px);
    @apply transition-all;
  }
  .visibleDel {
    transform: translateX(-20px);
    @apply bg-blue-400 transition-all w-10 h-10 absolute top-0;
  }
  .notVisibleDel {
    transform: translateX(0px);
    @apply bg-blue-400 transition-all w-10 h-10 absolute top-0;

  }
</style>




<button class="btn" on:click={() => isVisible = !isVisible}>Toggle Visibility</button>
