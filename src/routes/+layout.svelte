<script>
  import '../app.pcss';
  // Supports weights 100-900
  import '@fontsource-variable/sofia-sans';
  import { hideMainElements } from '$lib/stores/store.js';
  import FullPageWrapper  from '$lib/components/FullPageWrapper.svelte';
</script>

<svelte:head>
  <script src="https://www.youtube.com/iframe_api"></script>
</svelte:head>



<FullPageWrapper>
  <slot />
</FullPageWrapper>

<style>
  :global(body) {
    @apply w-full;
    -webkit-font-smoothing: antialiased;
    user-select: none;
    overflow: hidden;
    position: fixed;
    -webkit-overflow-scrolling: touch;
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