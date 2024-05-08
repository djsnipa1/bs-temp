<script>
  import anime from "animejs";
  import {onMount} from "svelte";

  let logo, circleMask, circle1, circle2, circle3, 
      circle1_1, circle1_2;
  
  const circlesScaling = (targets, opts) => ({
    targets,
    opacity: [
      { value: 1, duration: 1 },
      { value: 1, duration: 250 },
      { value: 0, duration: 700 }
    ],
    scale: { value: 10.5, duration: 2500 },
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
        targets: circle1_1,
        scale: [18, 0],
     /*   opacity: [{value: 1, duration: 1},
            {value: 1, duration: 450},
            {value: 0, duration: 300}], */
        duration: 2500
      }, 1500)
      .add({
        targets: logo,
        //opacity: 0,
        //scale: .6,
        scale: [ {value: 1.3, duration: 300, easing: "linear"},
                 {value: 0, duration: 400}],
        //duration: 200,
        offset: '-=600',
        easing: "linear"
      }, 1000)
      .add(circlesScaling(circle1, { borderWidth: '10px' }), 1500)
      .add(circlesScaling(circle2), 1800)
      .add({
        targets: circle3,
        scale: 6,
        opacity: [
          {value: 1, duration: 1},
          {value: [1, 1], duration: 500},
          {value: [1, 0], duration: 1199}
          ],
        duration: 1700
        }, 2100)
     /*   .add({
          targets: circle3,
          opacity: [1, 0],
          duration: 1000
        }, 2400)
        */
  }

  onMount(start);
</script>

<div class="w-full h-screen flex items-center justify-center">
  <div class="absolute rounded-full h-20 w-20 border-[10px] border-blue-400" bind:this={circleMask}></div>
  <div class="absolute rounded-full h-20 w-20 border-2 border-yellow-400 opacity-100" bind:this={circle1_1}></div>
  <div class="absolute rounded-full h-20 w-20 border-2 border-yellow-400 opacity-0" bind:this={circle1_2}></div>
  <div class="absolute rounded-full h-20 w-20 border-2 border-pink-400 opacity-0" bind:this={circle1}></div>
  <div class="absolute rounded-full h-20 w-20 border-2 border-pink-400 opacity-0" bind:this={circle2}></div>
  <div class="absolute rounded-full h-20 w-20 border-2 border-pink-400 opacity-0" bind:this={circle3}></div>
  <h1 class="text-2xl font-kiona opacity-0 text-white text-center" bind:this="{logo}">Beatstar<br />Practicer</h1>
</div>
