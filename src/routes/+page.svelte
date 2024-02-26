<script>
  import { VideoPosition } from '$lib';
  import { Controls } from '$lib';
  import { isControlsOpen } from '$lib/stores/ControlsStore.js';
</script>

<h1>{$isControlsOpen}</h1>

<button class="btn" on:click={() => { isControlsOpen.set(true); }}>
  Toggle Controls</button>

{#if $isControlsOpen}
<Controls style="top: 40px; left: 0; position: absolute; transform: translateX(290px);" />
{/if}

<VideoPosition class="absolute z-[1]" src="/beatstar-peru.mp4" />

