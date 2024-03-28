<script>
	import { VideoPosition } from '$lib';
	import { Controls, ControlsNew, SettingsButton } from '$lib';
	import { isControlsOpen } from '$lib/stores/store.js';
	import { browser } from '$app/environment';
	import { onMount, onDestroy } from 'svelte';
	import { fly, fade } from 'svelte/transition';

	let element;
	let dev = false;

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

<div class="border-aqua-500 relative min-h-screen min-w-full border">
	<nav class="absolute top-0 flex h-12 w-full items-center justify-between bg-yellow-500">
		<div
			style="transition: background-color 1s ease;"
			class="{$isControlsOpen ? 'bg-green-500' : 'bg-red-500'} top-8 ml-4 w-12 flex-none px-2"
		>
			{$isControlsOpen}
		</div>

		<div class="flex-none text-sm">logo</div>
		<div class="">
			<SettingsButton
				class="button mr-4 flex-1 rounded-md bg-slate-300 p-1 text-slate-700 shadow-md hover:bg-slate-400 hover:text-slate-800"
			/>
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
			class="absolute top-0 w-full"
			class:initialPosition={!$isControlsOpen}
			class:endPosition={$isControlsOpen}
		>
			<ControlsNew />
		</div>
	{:else}
		<div
			class="absolute top-0 w-full"
			class:initialPosition={$isControlsOpen}
			class:endPosition={!$isControlsOpen}
		>
			<ControlsNew />
		</div>
	{/if}

	<!-- <VideoPosition src="/beatstar-peru.mp4" /> -->
	<div class="w-full h-screen bg-slate-800"></div>
</div>

<style>
	.initialPosition {
		transform: translateY(-210px);
		/*	transition: all 500ms ease-in; */
		transition: all 1000ms cubic-bezier(0.6, 0.04, 0.98, 0.335); /* easeInCirc */
	}
	.endPosition {
		transform: translateY(40px);
		/*		transition: all 500ms cubic-bezier(0.25, 1, 0.5, 1); */
		transition: all 1000ms cubic-bezier(0.075, 0.82, 0.165, 1); /* easeOutCirc */
	}
</style>
