<script>
	import { isControlsOpen } from '$lib/stores/store.js';
</script>

<button
	class="glass-button button rounded-md p-2 text-slate-700 shadow-md hover:text-slate-800 hover:scale-110 active:scale-90 transition"
	{...$$restProps}
>
	<slot />
</button>

<style>
	.glass-button {
		/* display: inline-block; */
		border: 0;
		text-decoration: none;
		/* border-radius: 15px; */
		background-color: rgba(255,255,255,0.1);
		border: 1px solid rgba(255,255,255,0.1);
		backdrop-filter: blur(30px);
		color: rgba(255,255,255,0.8);
		/* font-size: 14px; */
		/* letter-spacing: 2px; */
		cursor: pointer;
		/* text-transform: uppercase; */
	}

	.glass-button:hover {
		background-color: rgba(255,255,255,0.2);
	}
	
</style>