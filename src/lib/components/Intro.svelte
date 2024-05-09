<script>
  import anime from "animejs";
  import {onMount} from "svelte";

  let animationOne = false;
  let animationTwo = true;
  
  let logo, loading, circleMask, circle1_1, circle1_2, circle1_3, 
      circle1_4, circle1_5, circle2_1, circle2_2, circle2_3, 
    circle2_4, circle2_5, circle2_6, circle2_7, finalMask;

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

  const circlesOpacity = (targets, opts) => ({
      targets,
      opacity: [ {value: 1, duration: 1},
                { value: 1, duration: 799},
                {value: 0, duration: 3000}],
    ...opts
  });
  
  function start() {
    let timelineOne = anime.timeline({ 
      autoplay: false,
      easing: "easeOutExpo",
      loop: true
  });
    let timelineTwo = anime.timeline({ autoplay: true, easing: "easeOutExpo", loop: true });
    
    timelineTwo
      .add({
      targets: logo,
      opacity: [ {value: 1, duration: 1} ], 
      scale: [ {value: [0, 1], duration: 1000} ]
    })
    .add(circlesScaling(circle2_1), 250)
    .add(circlesScaling(circle2_2), 450)
    .add({
      targets: circle2_3,
      opacity: [ {value: 1, duration: 1},
                { value: [1, 1], duration: 1100 },
                {value: [1, 0], duration: 399}],
      scale: { value: 6, duration: 1500 }
    }, 750)
 //   .add(circlesScaling(circle2_4), 4000)
    .add(circlesOpacity(circle2_4,
                        { scale: [0,8],
                        duration: 3000}
      ), 4000)
    .add(circlesOpacity(circle2_5,
                        { scale: [0,8],
                        duration: 2500}
      ), 4125)
    .add(circlesOpacity(circle2_6,
                        { scale: [0,8],
                        duration: 3000}
      ), 4450)
    .add(circlesOpacity(circle2_7,
                        { scale: [0,5],
                        duration: 3000}
      ), 4750)
    .add({
      targets: finalMask,
      scale: [12, 0],
      opacity: [ {value: 1, duration: 1},
                { value: 1, duration: 799},
                {value: 0, duration: 4000}],
      duration: 6000
    }, 5500)
  /*  .add({
      targets: logo,
      //opacity: 0,
      //scale: .6,
      scale: [ {value: 1.3, duration: 300, easing: "linear"},
               {value: 0, duration: 400}],
      //duration: 200,
      offset: '-=600',
      easing: "linear"
    }, 1000)
    .add(circlesScaling(circle2_2, { borderWidth: '10px' }), 1500)
    .add(circlesScaling(circle2_3), 1800)
    .add({
      targets: circle2_4,
      scale: 6,
      opacity: [
        {value: 1, duration: 1},
        {value: [1, 1], duration: 500},
        {value: [1, 0], duration: 1199}
        ],
      duration: 1700
      }, 2100)
    /*   .add({
        targets: circle1_3,
        opacity: [1, 0],
        duration: 1000
      }, 2400)
      */
    
    timelineOne
      .add({
        targets: loading,
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
        duration: 1500
      }, 1250)
      .add({
        targets: loading,
        //opacity: 0,
        //scale: .6,
        scale: [ {value: 1.3, duration: 300, easing: "linear"},
                 {value: 0, duration: 400}],
        //duration: 200,
        offset: '-=600',
        easing: "linear"
      }, 1000)
    /*  .add(circlesScaling(circle1, { borderWidth: '10px' }), 1500)
      .add(circlesScaling(circle2), 1800)
      .add({
        targets: circle1_3,
        scale: 6,
        opacity: [
          {value: 1, duration: 1},
          {value: [1, 1], duration: 500},
          {value: [1, 0], duration: 1199}
          ],
        duration: 1700
        }, 2100)
     /*   .add({
          targets: circle1_3,
          opacity: [1, 0],
          duration: 1000
        }, 2400)
        */
        
  }

  onMount(start);
</script>

<div class="w-full h-screen flex items-center justify-center">
  
  {#if animationTwo}
    <div class="absolute rounded-full h-20 w-20 border-[10px] border-green-400 opacity-0 z-10" bind:this={circleMask}></div>
    <div class="absolute rounded-full h-20 w-20 border-4 border-orange-300 opacity-0 z-10" bind:this={circle2_1}></div>
    <div class="absolute rounded-full h-20 w-20 border-2 border-orange-500 opacity-0 z-10" bind:this={circle2_2}></div>
    <div class="absolute rounded-full h-20 w-20 border-2 border-orange-700 opacity-0 z-10" bind:this={circle2_3}></div>
    <div class="absolute rounded-full h-20 w-20 border-[2px] border-pink-200 opacity-0 z-10" bind:this={circle2_4}></div>
    <div class="absolute rounded-full h-20 w-20 border-[5px] border-pink-400 opacity-0 z-10" bind:this={circle2_5}></div>
    <div class="absolute rounded-full h-20 w-20 border-[2px] border-pink-600 opacity-0 z-10" bind:this={circle2_6}></div>
    <div class="absolute rounded-full h-20 w-20 border-[2px] border-pink-800 opacity-0 z-10" bind:this={circle2_7}></div>

    <div class="absolute rounded-full h-20 w-20 border-[4px] border-yellow-500 bg-black opacity-0 z-0" bind:this={finalMask}></div>
    <h1 class="text-2xl font-kiona opacity-0 text-white text-center" bind:this="{logo}">Beatstar<br />Practicer</h1>
  {/if}
      
  {#if animationOne}
  <div class="absolute rounded-full h-20 w-20 border-[10px] border-blue-400" bind:this={circleMask}></div>
  <div class="absolute rounded-full h-20 w-20 border-2 border-yellow-400 opacity-100" bind:this={circle1_1}></div>
  <div class="absolute rounded-full h-20 w-20 border-2 border-yellow-400 opacity-0" bind:this={circle1_2}></div>
  <div class="absolute rounded-full h-20 w-20 border-2 border-pink-400 opacity-0" bind:this={circle1_3}></div>
  <div class="absolute rounded-full h-20 w-20 border-2 border-pink-400 opacity-0" bind:this={circle1_4}></div>
  <div class="absolute rounded-full h-20 w-20 border-2 border-pink-400 opacity-0" bind:this={circle1_5}></div>
  <h1 class="text-2xl font-kiona opacity-0 text-white text-center" bind:this="{loading}">Loading...</h1>
  {/if}

</div>

<style>

  .foreground {
    z-index: 10;
  }
  .background {
    z-index: 0;
  }
</style>
