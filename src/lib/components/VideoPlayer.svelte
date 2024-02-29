<script>
  export let src;

  function emptyFunction() {
  //  event.preventDefault();
  //return false;
  }
</script>

<!--<div class="shim min-w-full min-h-[25vh] border-pink-400 border-2">-->
<div class="video-container mx-auto">
<video autoplay loop muted playsinline class="border-2 border-blue-400" on:click|preventDefault={ emptyFunction }>
  <source type="video/mp4" src={src} id="player" />
  <track kind="captions" src="" srclang="en" label="English" default />
  Your browser does not support the video tag.
</video>
</div>
<!--</div>-->

<style>
  .video-container {
    width: 90%;
    height: auto;
  }
  .video-container > * {
    pointer-events: none;
  } 
  video {
    width: 100%;
    height: auto;
  }
  /* .shim {
    position: fixed;
    z-index: 50;
  } */
</style>