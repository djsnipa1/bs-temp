<script>
  import '../app.pcss';
  // Supports weights 100-900
  import '@fontsource-variable/sofia-sans';
  import { hideMainElements } from '$lib/stores/store.js';
</script>

<svelte:head>
  <script src="https://www.youtube.com/iframe_api"></script>
</svelte:head>

<!--
<div class="container relative t-[340px]">

<label>
  <input type="checkbox" bind:checked={circleVisible} />
  circleVisible
</label>

  <input type="range" bind:value={range} min="0" max="100" class="range range-primary w-1/2"/>

<p>{range}</p>


{#if circleVisible}
<div class="clip w-screen h-screen absolute t-0 bg-orange-500" style="--clip-range: circle({range}% at center)" transition:circleTransition>
  <slot />
</div>
{/if}

</div>

-->


  <slot />



<style>
  :global(body) {
    @apply w-full;
    -webkit-font-smoothing: antialiased;
    user-select: none;
    overflow: hidden;
    position: fixed;
    -webkit-overflow-scrolling: touch;
  }
  
  
  .clip {
    clip-path: var(--clip-range);
  }
  
  .gradient {
    background-image: linear-gradient(
      109.6deg,
      rgba(62, 161, 219, 1) 11.2%,
      rgba(93, 52, 236, 1) 100.2%
    );
  }
  
  .gradient-new {
  background-image: linear-gradient(
    45deg,
    hsl(240deg 100% 61%) 0%,
    hsl(223deg 100% 53%) 18%,
    hsl(215deg 100% 50%) 39%,
    hsl(215deg 99% 57%) 60%,
    hsl(215deg 82% 56%) 77%,
    hsl(215deg 71% 47%) 89%,
    hsl(214deg 80% 39%) 97%,
    hsl(211deg 100% 29%) 100%);
  }
</style>