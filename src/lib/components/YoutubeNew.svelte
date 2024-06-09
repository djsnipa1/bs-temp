<script>
  import { onMount } from 'svelte';

  export let player;
  export let initialVideoId = 'M7lc1UVf-VE';

  const ytPlayerId = 'youtube-player';

  onMount(() => {
    function load() {
      player = new YT.Player(ytPlayerId, {
        height: '100%',
        width: '100%',
        videoId: initialVideoId,
        playerVars: { autoplay: 0 }
      });
    }

    if (window.YT) {
      load();
    } else {
      window.onYouTubeIframeAPIReady = load;
    }
  });
</script>

<svelte:head>
  <script src="https://www.youtube.com/iframe_api"></script>
</svelte:head>

<div class="z-[1] container flex items-center justify-center">
  <div id={ytPlayerId} />
</div>
