<script>
  import { hideMainElements } from '$lib/stores/store.js';
</script>

<!-- <div class="z-[-10] flex items-center justify-center h-64  
bg-gradient-to-r 
from-yellow-800
to-blue-500 
via-sky-300
     animate-gradient-x       test
">
</div> -->


<!-- FullPageWrapper.svelte -->

<div
  class="{$hideMainElements
    ? 'bg-black'
    : 'full-page'} flex h-screen w-full items-center justify-center"
>
  <slot />
</div> 

<!-- <div class="full-page">
  <slot />
</div> -->


<style>
  .full-page {
    position: fixed; /* or 'absolute' if you prefer */
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1; /* Ensure it's above[ other content */
    /* background-image: repeating-linear-gradient(135deg, rgb(0,0,0) 0px, rgb(0,0,0) 10px,transparent 10px, transparent 11px),repeating-linear-gradient(22.5deg, rgb(0,0,0) 0px, rgb(0,0,0) 10px,transparent 10px, transparent 11px),linear-gradient(90deg, hsl(194,74%,56%),hsl(266,74%,56%),hsl(338,74%,56%),hsl(50,74%,56%),hsl(122,74%,56%)); */
    background-image: linear-gradient(201deg, rgb(129, 62, 46) 0%, rgb(129, 62, 46) 15%,rgb(145, 86, 35) 15%, rgb(145, 86, 35) 25%,rgb(160, 110, 23) 25%, rgb(160, 110, 23) 31%,rgb(176, 133, 12) 31%, rgb(176, 133, 12) 52%,rgb(191, 157, 0) 52%, rgb(191, 157, 0) 100%),linear-gradient(211deg, rgb(129, 62, 46) 0%, rgb(129, 62, 46) 15%,rgb(145, 86, 35) 15%, rgb(145, 86, 35) 25%,rgb(160, 110, 23) 25%, rgb(160, 110, 23) 31%,rgb(176, 133, 12) 31%, rgb(176, 133, 12) 52%,rgb(191, 157, 0) 52%, rgb(191, 157, 0) 100%),linear-gradient(253deg, rgb(129, 62, 46) 0%, rgb(129, 62, 46) 15%,rgb(145, 86, 35) 15%, rgb(145, 86, 35) 25%,rgb(160, 110, 23) 25%, rgb(160, 110, 23) 31%,rgb(176, 133, 12) 31%, rgb(176, 133, 12) 52%,rgb(191, 157, 0) 52%, rgb(191, 157, 0) 100%),linear-gradient(90deg, rgb(236, 184, 184),rgb(231, 180, 211)); background-blend-mode:overlay,overlay,overlay,normal;
  }
     
</style>
