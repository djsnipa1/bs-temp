<script>
  import anime from "animejs";
  import {onMount} from "svelte";

  let logo, circleMask, circle1, circle2, circle3;
  
  const circlesScaling = (targets, opts) => ({
    targets,
    opacity: [
      { value: 1, duration: 1 },
      { value: 1, duration: 250 },
      { value: 0, duration: 700 }
    ],
    scale: { value: 4.5, duration: 1000 },
    ...opts
  });

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
      }, 1550)
      .add(circlesScaling(circle1, { borderWidth: '10px', scale: 3.5 }), '-=400')
      .add(circlesScaling(circle2), '-=600')
      .add(circlesScaling(circle3), '-=800');
  }

  onMount(start);
</script>

<div class="w-full h-screen flex items-center justify-center">
  <div class="absolute rounded-full h-20 w-20 border-[20px] border-blue-400" bind:this={circleMask}></div>
  <div class="absolute rounded-full h-20 w-20 border-2 border-pink-400 opacity-0" bind:this={circle1}></div>
  <div class="absolute rounded-full h-20 w-20 border-2 border-pink-400 opacity-0" bind:this={circle2}></div>
  <div class="absolute rounded-full h-20 w-20 border-2 border-pink-400 opacity-0" bind:this={circle3}></div>
  <h1 class="text-2xl font-kiona opacity-0 text-white" bind:this="{logo}">Suckage</h1>
</div>
