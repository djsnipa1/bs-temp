<script>
	import { isControlsOpen } from '$lib/stores/store.js';
</script>

<button class="button rounded-md bg-slate-300 p-1 text-slate-700 shadow-md hover:bg-slate-400 hover:text-slate-800" {...$$restProps}>
	<slot />
</button>
