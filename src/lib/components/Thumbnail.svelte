<script>
  // This was an attempt to get the youtube thumbnail and extract the dominant color to use. It needed to have the images locally though so I gave up on it for now
  import { videoId } from '$lib/stores/store.js';

  $: video_thumbnail = `<img src="//img.youtube.com/vi/${$videoId}/0.jpg">`;

  $: imgUrl = `https://img.youtube.com/vi/${$videoId}/0.jpg`;

  console.log(imgUrl);
</script>

<!--
{@html video_thumbnail}
-->
