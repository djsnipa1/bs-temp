<script>
  import anime from 'animejs';
  import { onMount } from 'svelte';

  let logo;

  function start() {
    anime
      .timeline({
        easing: 'easeOutExpo',
        autoplay: true,
        loop: true
      })
      .add({
        targets: logo,
        scale: [0, 1],
        duration: 1000
      });
  }

  onMount(start);
</script>

<div class="flex h-screen w-full items-center justify-center">
  <h1 class="font-kiona text-2xl" bind:this={logo}>Suckage</h1>
</div>
