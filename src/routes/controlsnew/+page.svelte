<script>
	import { VideoPosition } from '$lib';
	import { Controls, ControlsNew, SettingsButton } from '$lib';
	import { isControlsOpen } from '$lib/stores/store.js';
	import { browser } from '$app/environment';
	import { onMount, onDestroy } from 'svelte';
	import { fly, fade } from 'svelte/transition';

	let element;
	let dev = true;

	/*	if (browser) {
		function centerElement() {
			const windowWidth = window.innerWidth;
			const elementWidth = element.offsetWidth;
			const leftPosition = (windowWidth - elementWidth) / 2;
			element.style.transform = `translateX(${leftPosition}px)`;
			console.log(leftPosition);
		}

		onMount(() => {
			window.addEventListener('resize', centerElement);
			centerElement();
		});

		onDestroy(() => {
			window.removeEventListener('resize', centerElement);
		});
	}
*/
	// Apply the translation using CSS transform
	// element.style.transform = `translateX(${translation}px)`;
</script>

<div class="relative min-h-screen min-w-full bg-slate-700 border border-aqua-500">
<nav class="absolute flex w-full h-12 top-0 justify-between items-center bg-yellow-500 ">
<div
	style="transition: background-color 1s ease;"
	class="{$isControlsOpen ? 'bg-green-500' : 'bg-red-500'} ml-4 px-2 top-8 flex-none w-12"
>
	{$isControlsOpen}
</div>

<div class="text-sm flex-none">logo</div>
<div class="">
  <SettingsButton
      class="button rounded-md p-1 mr-4 shadow-md bg-slate-300 text-slate-700 hover:bg-slate-400 hover:text-slate-800 flex-1" />
 </div>



</nav>

<!--
<button
	class="button btn bg-amber-50" style="position: statc;"
	on:click={() => {
		isControlsOpen.set(true);
	}}
>
		Toggle Controls</button
>
-->
{#if !dev}
	<div
		class="absolute w-full top-0 "
		class:initialPosition={!$isControlsOpen}
		class:endPosition={$isControlsOpen}
	>
		<ControlsNew />
	</div>
{:else}
	<div
		class="absolute w-full top-0 "
		class:initialPosition={$isControlsOpen}
		class:endPosition={!$isControlsOpen}
	>
		<ControlsNew />
	</div>
{/if}

<!-- <VideoPosition src="/beatstar-peru.mp4" /> -->
</div>
<style>
	.initialPosition {
		transform: translateY(-210px);
	/*	transition: all 500ms ease-in; */
		transition: all 1000ms cubic-bezier(0.600, 0.040, 0.980, 0.335); /* easeInCirc */
	}
	.endPosition {
transform: translateY(40px);
/*		transition: all 500ms cubic-bezier(0.25, 1, 0.5, 1); */
transition: all 1000ms cubic-bezier(0.075, 0.820, 0.165, 1.000); /* easeOutCirc */
	}
</style>
