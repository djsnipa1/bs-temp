<!-- Final -->
<script>
	import {
		YoutubeNewer,
		InputBoxFinal,
		ControlsNew,
		SettingsButton,
		UrlButton,
	} from "$lib";
	import { videoId } from "$lib/stores/store.js";
	import { copy } from "svelte-copy";
	import { cssPosition, isControlsOpen } from "$lib/stores/store.js";

	let player;

	// const toggle = () => {
	// 	console.log('changing video id');
	// 	// player.loadVideoById('dQw4w9WgXcQ');
	// 	player.loadVideoById($videoId);
	// };

	// Reactive statement to load a new video when $videoId changes
	$: if ($videoId && player && typeof player.loadVideoById === "function") {
		player.loadVideoById($videoId);
	}

	export let min = -33;
	export let max = 33;
	export let step = 3;
	export let value = 0;

	let style = "";

	$: style = `width: ${value}vw; height: ${value}px;`;
</script>

<div class="border-aqua-500 relative min-h-screen min-w-full border">
	<nav
		class="absolute top-0 z-[500] flex h-12 w-full items-center justify-between bg-gradient-to-b from-yellow-400 to-amber-600 rounded-sm shadow-sharp">
		<!-- <div
			style="transition: background-color 1s ease"
			class="{$isControlsOpen ? 'bg-green-500' : 'bg-red-500'} top-8 ml-4 w-12 flex-none px-2">
			{$isControlsOpen}
		</div> -->

		<UrlButton
			class="button ml-4 flex-none rounded-md bg-slate-300 p-1 text-slate-700 shadow-md hover:bg-slate-400 hover:text-slate-800" />
		<div
			class="flex-none text-md font-bold text-slate-700 text-center leading-4 font-sofiasans">
			Beatstar<br />Practicer
		</div>
		<div class="">
			<SettingsButton
				class="button mr-4 flex-1 rounded-md bg-slate-300 p-1 text-slate-700 shadow-md hover:bg-slate-400 hover:text-slate-800" />
		</div>
	</nav>

	<div
		class="absolute top-0 w-full"
		class:initialPosition="{!$isControlsOpen}"
		class:endPosition="{$isControlsOpen}">
		<ControlsNew />
	</div>

	<!-- InputBoxNew -->
	<div class="container absolute z-[750] border-red-500 border-2 pt-1 h-22 rounded-bl-lg rounded-br-lg flex items-center justify-center">

		<InputBoxFinal />

	</div>

	<div class="container">
		<YoutubeNewer bind:player />
	</div>

	<!--	<div class="justify-items container">
		<button
			class="tooltip tooltip-left absolute right-4 z-[40] m-2 rounded-md bg-slate-600 p-2 text-slate-300 shadow-sm hover:bg-amber-500"
			data-tip="copied!"
			use:copy="{'https://m.youtube.com/watch?v=9B1SQX9a_hU'}">
			<svg
				xmlns="http://www.w3.org/2000/svg"
				width="1em"
				height="1em"
				viewBox="0 0 24 24"
				{...$$props}>
				<path
					fill="currentColor"
					d="M5.503 4.627L5.5 6.75v10.504a3.25 3.25 0 0 0 3.25 3.25h8.616a2.251 2.251 0 0 1-2.122 1.5H8.75A4.75 4.75 0 0 1 4 17.254V6.75c0-.98.627-1.815 1.503-2.123M17.75 2A2.25 2.25 0 0 1 20 4.25v13a2.25 2.25 0 0 1-2.25 2.25h-9a2.25 2.25 0 0 1-2.25-2.25v-13A2.25 2.25 0 0 1 8.75 2zm0 1.5h-9a.75.75 0 0 0-.75.75v13c0 .414.336.75.75.75h9a.75.75 0 0 0 .75-.75v-13a.75.75 0 0 0-.75-.75" />
			</svg>
		</button>

		<div class="mockup-code m-4 bg-slate-900 text-xs">
			<pre><code>https://m.youtube.com/watch?v=9B1SQX9a_hU</code></pre>
		</div>
	</div>
	-->
</div>

<style>
	:root {
		/*
	range 
	--filler-size: 200px;
	--filler-offset: 2rem;
	--range-shdw: red;
*/
	}
	.initialPosition {
		transform: translateY(-230px);
		/*	transition: all 500ms ease-in; */
		transition: all 600ms cubic-bezier(0.6, 0.04, 0.98, 0.335); /* easeInCirc */
	}
	.endPosition {
		/* transform: translateY(60px); */
		/*		transition: all 500ms cubic-bezier(0.25, 1, 0.5, 1); */
		transition: all 600ms cubic-bezier(0.075, 0.82, 0.165, 1); /* easeOutCirc */
		@apply top-11 z-[10];
	}
	.shadow-sharp {
		box-shadow:
			0 1px 1px rgba(0, 0, 0, 0.25),
			0 2px 2px rgba(0, 0, 0, 0.2),
			0 4px 4px rgba(0, 0, 0, 0.15),
			0 8px 8px rgba(0, 0, 0, 0.1),
			0 16px 16px rgba(0, 0, 0, 0.05);
	}
	.shadow-diffuse {
		box-shadow:
			0 1px 1px rgba(0, 0, 0, 0.08),
			0 2px 2px rgba(0, 0, 0, 0.12),
			0 4px 4px rgba(0, 0, 0, 0.16),
			0 8px 8px rgba(0, 0, 0, 0.2);
	}
</style>
