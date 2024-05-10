<script>
  import anime from 'animejs';
  import { onMount } from 'svelte';

  let animationOne = true;
  let animationTwo = true;

  let timelineOne;

  let logo,
    loading,
    circleMask,
    circle1_1,
    circle1_2,
    circle1_3,
    circle1_4,
    circle1_5,
    circle2_1,
    circle2_2,
    circle2_3,
    circle2_4,
    circle2_5,
    circle2_6,
    circle2_7,
    finalMask;

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
    opacity: [
      { value: 1, duration: 1 },
      { value: 1, duration: 799 },
      { value: 0, duration: 3000 }
    ],
    ...opts
  });

  function calculate() {
    let scale = 1;

    if (circleMask) {
      const currentDivSize = Math.min(
        circleMask.offsetWidth,
        circleMask.offsetHeight
      ); // Get the smaller dimension
      const viewportWidth = window.innerWidth;
      const viewportHeight = window.innerHeight;
      const extraSpace = 10; // Adjust this value based on how much extra space you want around the div

      // Calculate the scaling factor
      scale =
        Math.max(
          viewportWidth / currentDivSize,
          viewportHeight / currentDivSize
        ) +
        extraSpace / currentDivSize;

      console.log(scale);
    }
  }

  function playAnimation() {
    console.log('clickkin');
    timelineOne.play();
  }
  function start() {
    calculate();
    timelineOne = anime.timeline({
      autoplay: false,
      easing: 'easeOutExpo',
      loop: false
    });
    let timelineTwo = anime.timeline({
      autoplay: false,
      easing: 'easeOutExpo',
      loop: false
    });

    timelineOne
      .add({
        targets: loading,
        opacity: [{ value: 1, duration: 1 }],
        scale: [{ value: [0, 1], duration: 1000 }]
      })
      .add({
        targets: circleMask,
        scale: [{ value: [11, 0], duration: 1100 }]
      })
      .add(
        {
          targets: circle1_1,
          scale: [11, 0],
          duration: 1100
        },
        1200
      )
      .add(
        {
          targets: loading,
          //opacity: 0,
          //scale: .6,
          scale: [
            { value: 1.3, duration: 300, easing: 'linear' },
            { value: 0, duration: 400 }
          ],
          //duration: 200,
          offset: '-=600',
          easing: 'linear',
          complete: function () {
            setTimeout(() => {
              timelineTwo.play();
            }, 1500);
          }
        },
        1000
      );
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

    timelineTwo
      .add({
        targets: logo,
        opacity: [{ value: 1, duration: 1 }],
        scale: [
          { value: [0, 1.15], duration: 650 },
          { value: [1.15, 1], duration: 150 }
        ]
      })
      // .add(circlesScaling(circle2_1), 250)
      .add(circlesOpacity(circle2_1, { scale: [0, 15], duration: 3000 }), 250)
      // .add(circlesScaling(circle2_2), 450)
      .add(circlesOpacity(circle2_2, { scale: [0, 15], duration: 2500 }), 550)
      .add(circlesOpacity(circle2_3, { scale: [0, 6.5], duration: 2500 }), 950)
      /*   .add(
        {
          targets: circle2_3,
          opacity: [
            { value: 1, duration: 1 },
            { value: [1, 1], duration: 1100 },
            { value: [1, 0], duration: 399 }
          ],
          scale: { value: 6, duration: 1500 }
        },
        750
      )
      */
      //   .add(circlesScaling(circle2_4), 4000)

      .add(
        {
          targets: finalMask,
          scale: { value: [12, 0], duration: 1000 },
          opacity: [
            { value: 1, duration: 1 },
            { value: 1, duration: 799 },
            { value: 0, duration: 1000 }
          ],
          duration: 2000
        },
        4000
      )
      .add(
        {
          targets: logo,
          //opacity: 0,
          //scale: .6,
          scale: [
            { value: 1.3, duration: 500, easing: 'easeOutQuad' },
            //              {value: 1.3, duration: 200},
            { value: 0, duration: 500, easing: 'easeOutQuad' }
          ],
          duration: 1800
          // offset: '-=600',
          //   easing: "easeInOutExpo"
        },
        3500
      )
      .add(circlesOpacity(circle2_4, { scale: [0, 9], duration: 2500 }), 3500)
      .add(circlesOpacity(circle2_5, { scale: [0, 8], duration: 2000 }), 3650)
      .add(circlesOpacity(circle2_6, { scale: [0, 8], duration: 2500 }), 3800)
      .add(circlesOpacity(circle2_7, { scale: [0, 5], duration: 2000 }), 4050);
    /*    .add(circlesScaling(circle2_2, { borderWidth: '10px' }), 1500)
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
  }

  onMount(start);
</script>

<div class="flex h-screen w-full items-center justify-center">
  <button class="button btn absolute z-20 opacity-50" on:click={playAnimation}
    >play</button
  >
  <!-- {#if animationTwo} -->
  <!-- animationTwo -->
  <div
    class="absolute z-10 h-20 w-20 rounded-full border-8 border-white opacity-0"
    bind:this={circle2_1}
  ></div>
  <div
    class="absolute z-10 h-20 w-20 rounded-full border-2 border-white opacity-0"
    bind:this={circle2_2}
  ></div>
  <div
    class="absolute z-10 h-20 w-20 rounded-full border-2 border-white opacity-0"
    bind:this={circle2_3}
  ></div>
  <div
    class="absolute z-10 h-20 w-20 rounded-full border-2 border-white opacity-0"
    bind:this={circle2_4}
  ></div>
  <div
    class="absolute z-10 h-20 w-20 rounded-full border-[9px] border-white opacity-0"
    bind:this={circle2_5}
  ></div>
  <div
    class="absolute z-10 h-20 w-20 rounded-full border-[2px] border-white opacity-0"
    bind:this={circle2_6}
  ></div>
  <div
    class="absolute z-10 h-20 w-20 rounded-full border-[2px] border-white opacity-0"
    bind:this={circle2_7}
  ></div>

  <div
    class="absolute z-0 h-20 w-20 rounded-full bg-black opacity-100"
    bind:this={finalMask}
  ></div>
  <h1
    class="absolute text-center font-kiona text-3xl text-white opacity-0"
    bind:this={logo}
  >
    Beatstar<br />Practicer
  </h1>
  <!-- {/if} -->

  <!-- {#if animationOne} -->
  <!-- animationOne -->
  <div
    class="absolute h-20 w-20 rounded-full border-8 border-white"
    bind:this={circleMask}
  ></div>
  <div
    class="absolute h-20 w-20 rounded-full border-2 border-white opacity-100"
    bind:this={circle1_1}
  ></div>
  <div
    class="absolute h-20 w-20 rounded-full border-2 border-yellow-400 opacity-0"
    bind:this={circle1_2}
  ></div>
  <div
    class="absolute h-20 w-20 rounded-full border-2 border-pink-400 opacity-0"
    bind:this={circle1_3}
  ></div>
  <div
    class="absolute h-20 w-20 rounded-full border-2 border-pink-400 opacity-0"
    bind:this={circle1_4}
  ></div>
  <div
    class="absolute h-20 w-20 rounded-full border-2 border-pink-400 opacity-0"
    bind:this={circle1_5}
  ></div>
  <h1
    class="absolute text-center font-kiona text-3xl text-white opacity-0"
    bind:this={loading}
  >
    Loading...
  </h1>
  <!-- {/if} -->
</div>

<!--
<div style="position:relative; width:100%; height:0px; padding-bottom:216.949%">
  <iframe
    allow="fullscreen"
    allowfullscreen
    height="100%"
    src="https://streamable.com/e/iuv1ve?muted=1"
    width="100%"
    style="border:none; width:100%; height:100%; position:absolute; left:0px; top:0px; overflow:hidden;"
  ></iframe>
</div>
-->
<style>
</style>
