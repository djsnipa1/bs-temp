<script>
  import anime from "animejs";
  import {onMount} from "svelte";

  let logo, circleMask;

  function start() {
    anime
      .timeline({
        easing: "easeOutExpo",
        autoplay: true,
        loop: true,
      })
      .add({
        targets: logo,
        opacity: [ {value: 1, duration: 1} ], 
        scale: [ {value: [0, 1], duration: 1000} ]
        
      })
      .add({
        targets: circleMask,
        scale: [{value: [18, 0], duration: 1500}]
      })
      .add({
        targets: logo,
        opacity: 0,
        scale: .6,
        duration: 200,
        easing: "linear"
      }, 1550);
  }

  onMount(start);
</script>

<div class="w-full h-screen flex items-center justify-center">
  <div class="absolute rounded-full h-20 w-20 border-[20px] border-blue-400" bind:this={circleMask}></div>
  <h1 class="text-2xl font-kiona opacity-0" bind:this="{logo}">Suckage</h1>
</div>
