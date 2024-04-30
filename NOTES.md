## Animation Timeline

mainCircle 700

circles 1, 2, 3 timeline
begin: opacity 0 -> 1
scale 1000
fadeOut 750
start -=500

circle1 scale 1500
2200

---

## [How to use youtube embed api in svelte](https://stackoverflow.com/questions/76690112/how-to-use-youtube-embed-api-in-svelte)

After a discussion in the svelte discord server, I have the following solution. Hopefully this can help anyone else going through the pain i just did trying to work this out.

I create a youtube component (feel free to modify any of the properties in the `YT.Player()`:

```
<script>
    import { onMount } from 'svelte';

    export let player;
    export let initialVideoId = '';

    const ytPlayerId = 'youtube-player';

    onMount(() => {
        function load() {
            player = new YT.Player(ytPlayerId, {
                height: '100%',
                width: '100%',
                videoId: initialVideoId,
                playerVars: { autoplay: 1 }
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

<div id={ytPlayerId} />

```

The key things to note here are:

1.  the script tag in `<svelte:head>` injects the iframe api code.
2.  VScode (or whatever editor) will underline a bunch of things in red like `Cannot find name 'YT'` or `Property 'onYouTubeIframeAPIReady' does not exist on type 'Window & typeof globalThis'`. You can ignore these as these reference code that gets injected from the iframe api code, and will function properly when actually running in the browser
3.  The `if (window.YT)...` statement is very important - the first time the embed is mounted, window.YT property will not exist, so `window.onYouTubeIframeAPIReady = load;` what this does is when the loaded iframe api code runs, it will attempt to execute window.onYouTubeIframeAPIReady(). Since this function gets set to load, then the `player = new YT.player(...` as per youtube's example code in their docs linked in the OP.

However, if you navigate away to another page on your site and then return to the page with the embed, since sveltekit sites act like an SPA, all the code loaded from the script tag remains. What ends up happening is that some logic in the loaded iframe api code causes the onYouTubeIframeAPIReady function to not be run again, and thus a new player element is not created. If you refreshed the page and thus removed all the loaded code, the embed would load properly again. To solve this, if `window.YT` exists (which is some property that the loaded iframe api code creates), then we can directly create a new player by calling `load()` and we can be certain that the loaded api code has already been added to our page and the player will function properly.

Then we can import the component within a page and also access the player object by binding to it:

```
<script>
  import Youtube from '$lib/youtube.svelte';

  let player

  const toggle = () => {
    console.log('changing video id')
    player.loadVideoById("dQw4w9WgXcQ");
  }
</script>

<Youtube bind:player/>

<button on:click={toggle}>change video</button>

```

Using `player` you can then access any of the youtube embed api provided functions like loadVideoById or getCurrentTime. In the above example, clicking on the button changes the video to the given youtube video id.

Also, i have elected to disable ssr for the page using the embed, given the multiple references to window. I have had some occurrences where leaving ssr enabled has resulted in errors, but it was inconsistent and i didn't bother trying to find out exactly what caused them.

On a side note, the `YT.Player()` initialisation accepts % values for height and width, so i have found it easiest to set them to 100% and then put the embed inside a wrapper element which you can size however you want with css directly.

---

## ChatGPT Answer to the above question:

To make the buttons in a separate component control a video player on the main page in SvelteKit, you can use **component binding** to create a connection between the two. Here's a high-level approach:

1. **Define a video player component** that includes the `<video>` element and exposes methods to play, pause, and seek the video.
2. **Create a control component** with buttons for play, pause, etc., and use **event dispatching** to signal user interactions.
3. **In your main page**, import both components and create a **store** or a **context** to share the video player's state and methods.
4. **Bind the control component** to the video player using Svelte's binding syntax to react to the dispatched events and call the corresponding methods on the video player.

Here's a simplified example to illustrate the concept:

```svelte
<!-- VideoPlayer.svelte -->
<script>
  import { createEventDispatcher } from 'svelte';
  const dispatch = createEventDispatcher();
  let videoElement;

  function play() {
    videoElement.play();
    dispatch('update', { playing: true });
  }

  function pause() {
    videoElement.pause();
    dispatch('update', { playing: false });
  }
</script>

<video bind:this={videoElement} src="your-video-source.mp4"></video>
<button on:click={play}>Play</button>
<button on:click={pause}>Pause</button>

<!-- Controls.svelte -->
<script>
  export let onPlay;
  export let onPause;
</script>

<button on:click={onPlay}>Play</button>
<button on:click={onPause}>Pause</button>

<!-- Main.svelte -->
<script>
  import VideoPlayer from './VideoPlayer.svelte';
  import Controls from './Controls.svelte';
  let videoPlayer;

  function handleUpdate(event) {
    // Update UI based on the video player's state
  }
</script>

<VideoPlayer bind:this={videoPlayer} on:update={handleUpdate} />
<Controls onPlay={videoPlayer.play} onPause={videoPlayer.pause} />
```

In this setup, the `Controls` component receives functions as props, which are bound to the corresponding methods of the `VideoPlayer` instance. When a button is clicked in the `Controls` component, it calls the function passed down from the main page, which in turn calls the method on the `VideoPlayer`.

Remember to handle the video player's state appropriately and ensure that the controls reflect the current state of the video. This might involve using reactive statements or stores to keep everything in sync.

For more detailed examples and best practices, you might want to check out resources like the [Svelte tutorial on media elements](^2^) or community-contributed video player components on GitHub¹³.

Source: Conversation with Bing, 4/8/2024
(1) Advanced bindings / Media elements • Svelte Tutorial. https://learn.svelte.dev/tutorial/media-elements.
(2) GitHub - basaran/svelte-video-player-kit: Basic video player component .... https://github.com/basaran/svelte-video-player-kit.
(3) meigo/svelte-video-player: Basic video player component for svelte - GitHub. https://github.com/meigo/svelte-video-player.
(4) How to click a button in one component and trigger an event in another .... https://stackoverflow.com/questions/63750996/how-to-click-a-button-in-one-component-and-trigger-an-event-in-another-component.
(5) undefined. https://svelte-video-player.netlify.app/.
(6) undefined. https://www.server.com/poster.jpg.
(7) undefined. https://www.server.com/video.webm.
(8) undefined. https://www.server.com/video.mp4.
(9) undefined. https://www.server.com/video.ogv.

---

## Display portion of video

To display only a portion of a video, such as the left, center, or right 1/3 of the video, you can use CSS to achieve this effect. The key properties you'll use are `object-fit` and `object-position`. The `object-fit` property controls how the video's size is adjusted to fit within the frame, and `object-position` allows you to adjust the positioning of the video within the element's frame.

Here's a step-by-step guide on how to implement this:

1. **Wrap the Video Element**: First, wrap your `<video>` element in a container div. This container will help you control the size and positioning of the video.

```html
<div class="video-container">
  <video id="myVideo" src="your-video.mp4"></video>
</div>
```

2. **Style the Container and Video**: Use CSS to set the size of the container and the video. For the video, you'll want to use `object-fit: cover;` to ensure the video covers the container without distorting its aspect ratio. Then, use `object-position` to control which part of the video is visible.

- **Left 1/3**: To show the left 1/3 of the video, you can set the `object-position` to `0%  50%`.
- **Center 1/3**: For the center 1/3, set `object-position` to `33%  50%`.
- **Right 1/3**: To display the right 1/3, use `object-position` at `66%  50%`.

```css
.video-container {
  width: 100%; /* Adjust the width as needed */
  height: 0;
  padding-bottom: 100%; /* Maintain aspect ratio */
  position: relative;
  overflow: hidden; /* Hide the parts of the video outside the container */
}

#myVideo {
  width: 100%;
  height: 100%;
  position: absolute;
  object-fit: cover;
  /* Adjust object-position based on which part of the video you want to show */
  object-position: 0% 50%; /* For left  1/3 */
}
```

3. **Adjust CSS Based on Desired Portion**: Change the `object-position` value in the `#myVideo` CSS rule to adjust which part of the video is visible.

- **Left 1/3**: `object-position:  0%  50%;`
- **Center 1/3**: `object-position:  33%  50%;`
- **Right 1/3**: `object-position:  66%  50%;`

This approach allows you to control the portion of the video displayed by adjusting the `object-position` property. Remember, the `object-position` property uses percentages to position the video within the container, with `0%  0%` being the top-left corner and `100%  100%` being the bottom-right corner. By setting the horizontal value to `33%` or `66%` and the vertical value to `50%`, you're effectively showing the left, center, or right third of the video.
