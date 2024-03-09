<script>
	import { scale, fade } from 'svelte/transition';
	import { browser } from '$app/environment';
	import { elasticOut } from 'svelte/easing';
	import { onMount } from 'svelte';
	import anime from 'animejs';

	//	let scaling = false;
	let div1, div2, div3, w, h, vw, vh, r, divWidth, divHeight, scaleFinal;
	let style, currentWidth, currentHeight, desiredHeight, desiredWidth, scaleX, scaleY;

	$: scaleFinal;
	$: divWidth;

	if (browser) {
		vw = window.innerWidth; // viewport width
		vh = window.innerHeight; // viewport height

		if (vw > vh) {
			console.log('The viewport width is larger than the height');
			scaleFinal = vw / parseFloat(divWidth);
		} else if (vh > vw) {
			console.log('The viewport height is larger than the width');
			scaleFinal = vh / parseFloat(divWidth);
		} else {
			console.log('The viewport width and height are equal');
			scaleFinal = vh / parseFloat(divWidth);
		}
		console.log(scaleFinal);
	}

	onMount(setup);

	const drawLine = (targets, opts) => ({
		targets,
		scale: 8,
		borderWidth: '5px',
		...opts
	});

	function setup() {
		anime
			.timeline({
				easing: 'easeOutExpo',
				autoplay: true,
				loop: true
			})
			.add(drawLine(div1, { duration: 2000, opacity: 100 }), 250)
			.add(drawLine(div2, { duration: 2000, opacity: 100 }), 750)
			.add({ targets: div3, scale: 8, borderWidth: 5, duration: 4000, opacity: 100 }, 0);
	}
</script>

<div id="suck" class="border border-pink-500" bind:clientWidth={w} bind:clientHeight={h}>
	<!--<span style="font-size: {size}px" contenteditable>{text}</span>-->
	<span class="size">{w} x {h}px</span><br />
	{scaleFinal}<br />
	{divWidth}
</div>
<div class="background flex min-h-full min-w-full items-center justify-center">
	<button
		on:click={() => {
			scaling = !scaling;
		}}
		class="btn">Scale Bitch</button
	>

	<!--  {#if scaling} -->
	<div
		id="div1"
		bind:this={div1}
		bind:clientWidth={divWidth}
		bind:clientHeight={divHeight}
		class="border-1 absolute mx-auto h-20 w-20 rounded-[100%] border-amber-500 opacity-0"
	></div>
	<div
		id="div2"
		bind:this={div2}
		class="border-1 absolute mx-auto h-20 w-20 rounded-[100%] border-white opacity-0"
	></div>
	<div
		id="div3"
		bind:this={div3}
		class="border-1 absolute mx-auto h-20 w-20 rounded-[100%] border-pink-400 opacity-0"
	></div>
	<!--{/if} -->
</div>

<style>
	.background {
		position: absolute;
		height: 100%;
		width: 100%;
		top: 0;
		left: 0;
		background-color: #282828;
		/* background-color: #d2ff57; */
		background-image: url('https://www.transparenttextures.com/patterns/3px-tile.png');
		background-repeat: repeat;
		background-size: auto;
		z-index: -1; /* Places the background behind the content */
	}
	p {
		color: white;
	}

	#suck {
		width: 150px;
		height: 150px;
		color: white;
	}
</style>
