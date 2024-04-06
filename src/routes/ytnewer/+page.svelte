<script>
</script>

<div class="video-background">
  <!-- <div class="video-foreground"> -->
  <div class="video-foreground aspect-[9/16] h-screen w-full md:max-w-sm">
    <iframe
      src="https://www.youtube.com/embed/9B1SQX9a_hU?controls=0&showinfo=0&rel=0&autoplay=0&loop=1"
      frameborder="0"
      allowfullscreen
    ></iframe>
  </div>
</div>

<style>
  /* * { box-sizing: border-box; } */
  .video-background {
    background: #000;
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: -99;
  }
  .video-foreground,
  .video-background iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    /* pointer-events: none; */
    object-fit: cover;
    /* Adjust object-position based on which part of the video you want to show */
    /*    object-position: 60% 50%;  For left  1/3 */
    object-position: 0% 50%;
  }
  @media (min-aspect-ratio: 16/9) {
    .video-foreground {
      height: 300%;
      top: -100%;
    }
  }
  @media (max-aspect-ratio: 16/9) {
    .video-foreground {
      width: 300%;
      left: -100%;
    }
  }
  @media all and (max-width: 600px) {
    .vid-info {
      width: 50%;
      padding: 0.5rem;
    }
    .vid-info h1 {
      margin-bottom: 0.2rem;
    }
  }

  .responsive {
    width: 100%;
    height: 0;
    padding-bottom: 56.25%;
    position: relative;
  }
  .responsive iframe {
    position: absolute;
    width: 100%;
    height: 100%;
  }
  .mainContent {
    max-width: 800px;
    margin: 0 auto;
    padding: 100px 0 0;
  }
  .video-containers {
    width: 100%;
    height: auto;
    padding-bottom: 100%; /* Maintain aspect ratio */
    position: relative;
    overflow: hidden; /* Hide the parts of the video outside the container */
  }
  .video-containers iframe {
    width: 100%;
    height: 100%;
    position: absolute;
    object-fit: cover;
    /* Adjust object-position based on which part of the video you want to show */
    object-position: 60% 50%; /* For left  1/3 */
  }
  /* In your global CSS file, e.g., app.css */
  .video-container {
    @apply relative h-2 w-full;
  }
  .video-container iframe {
    @apply absolute left-0 top-0 h-full w-full;
    object-fit: cover;
  }

  /* Adjust the video-container class for smaller screens */
  /* @media (max-width: 640px) {
		.video-container {
			@apply relative h-screen w-full;
		}

		.video-container iframe {
			@apply absolute left-0 top-0 h-full w-full;
			object-fit: cover;
		}
	} */
</style>
