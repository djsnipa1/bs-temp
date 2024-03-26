<script>
	import '../app.pcss';
	// Supports weights 100-900
	import '@fontsource-variable/sofia-sans';
</script>

<svelte:head>
	<script src="https://www.youtube.com/iframe_api"></script>
</svelte:head>

<slot />

<style>
	body {
		@apply bg-stone-950;
		-webkit-font-smoothing: antialiased;
		user-select: none;
	}
</style>
