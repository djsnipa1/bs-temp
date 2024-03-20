<script>
	import { VideoPosition } from '$lib';
	import { ControlsNew } from '$lib';
	import { isControlsOpen } from '$lib/stores/store.js';
	import { browser } from '$app/environment';
	import { onMount, onDestroy } from 'svelte';
	import { fly } from 'svelte/transition';

	let element;
	let old = false;
	/*
	if (browser) {
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

q
<h1 class="absolute left-5 top-10 z-[5000a]">isControlsOpen = {$isControlsOpen}</h1>

<button
	class="btn z-[5000]"
	on:click={() => {
		isControlsOpen.set(true);
	}}
>
	Toggle Controls</button
>

{#if old}
	<!-- <Controls style="top: 40px; left: 0; position: absolute; transform: translateX(290px);" /> -->
	<div
		class="container top-8"
		class:initialPosition={!$isControlsOpen}
		class:endPosition={$isControlsOpen}
	>
		<ControlsNew />
	</div>
{:else}
	<div
		class="container absolute z-[100] -translate-x-[0px] translate-y-8"
		transition:fly={{ x: '290px', duration: 5000 }}
	>
		<ControlsNew />
	</div>
{/if}

<VideoPosition src="/beatstar-peru.mp4" />

<style>
	.initialPosition {
		transform: translateY(190px);
		transition: all 2000ms ease-in;
	}
	.endPosition {
		transform: translateX(30px);
		/* transition: all 2000ms ease-out; */
		transition: all 2000ms cubic-bezier(0.25, 1, 0.5, 1);
	}
</style>
