<script>
	export let src;

	function emptyFunction() {}
</script>

<!--<div class="shim min-w-full min-h-[25vh] border-pink-400 border-2">-->
<div class="aspect-[9/16] h-screen w-full">
	<video
		autoplay
		loop
		muted
		playsinline
		id="myVideo"
		class="border-2 border-blue-400"
		on:click|preventDefault={emptyFunction}
	>
		<source type="video/mp4" {src} id="player" />
		<track kind="captions" src="" srclang="en" label="English" default />
		Your browser does not support the video tag.
	</video>
</div>

<style>
	/* .video-container > * {
    pointer-events: none;
  }  */
	.video-container {
		width: 100%;
		height: auto;
		padding-bottom: 100%; /* Maintain aspect ratio */
		position: relative;
		overflow: hidden; /* Hide the parts of the video outside the container */
	}

	#myVideo {
		width: 100%;
		height: 100%;
		position: absolute;
		object-fit: cover;
		/* Adjust object-position based on which part of the video you want to show */
		object-position: 60% 50%; /* For left  1/3 */
	}
</style>
