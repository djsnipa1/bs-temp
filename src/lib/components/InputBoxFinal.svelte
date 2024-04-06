<script>
  import { videoId } from '$lib/stores/YoutubeURL.js';
  import { isUrlOpen, menuOpen } from '$lib/stores/store.js';

  $: currentBind = '';
  let newId;

  function getYouTubeID(url) {
    // Define a regular expression to match different YouTube URL formats
    var regex =
      /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#&?]*).*/;
    // Use the match() method to extract the video ID
    var match = String(url).match(regex);
    // Check if the match is valid and the ID is 11 characters long
    if (match && match[7].length == 11) {
      // Return the video ID
      return match[7];
    } else {
      // Return an empty string or an error message
      return '';
    }
  }

  // Test the function with some sample URLs
  console.log(getYouTubeID('https://www.youtube.com/watch?v=qeMFqkcPYcg')); // qeMFqkcPYcg
  console.log(getYouTubeID('https://youtu.be/qeMFqkcPYcg')); // qeMFqkcPYcg
  console.log(getYouTubeID('https://www.youtube.com/embed/qeMFqkcPYcg')); // qeMFqkcPYcg
  console.log(getYouTubeID('https://www.youtube.com/v/qeMFqkcPYcg')); // qeMFqkcPYcg
  console.log(getYouTubeID('https://www.youtube.com/watch?v=invalid')); // ""
  console.log(getYouTubeID('https://youtu.be/m_xoN8KlP3w'));

  let inputValue = '';
  let ytValue = '';
  // This function will be called every time the input value changes
  function handleInput(event) {
    inputValue = event.target.value;
    console.log(inputValue); // Log the current value of the input
    ytValue = getYouTubeID(inputValue);
    if (typeof ytValue !== 'string' || ytValue === '') {
      console.log('The function did not return a truthy value');
      // return ''
    } else {
      console.log('The function returned a truthy value:', ytValue);
      $videoId = ytValue;
    }
  }

  function handleMenuOpen() {
    $isUrlOpen = true;
    console.log('open');
    document.body.addEventListener('click', handleMenuClose);
  }
  function handleMenuClose() {
    $isUrlOpen = false;
    console.log('close');
    document.body.removeEventListener('click', handleMenuClose);
  }
</script>

<!--{#if $isUrlOpen} -->
  <div
    on:click|stopPropagation={() => {}}
    class="container flex items-center justify-center"
  >
    <!-- <input type="text" class="input input-sm input-bordered w-full max-w-xs" on:input={handleInput} /> -->
    <!-- <label class="form-control w-full max-w-xs"> -->

    <input
      type="text"
      placeholder="https://youtu.be/m_xoN8KlP3w"
      on:input={handleInput}
      class="input input-sm input-bordered w-full max-w-xs"
    />

    <!-- <div class="label"> -->
    <!-- <span class="label-text-alt">Paste YouTube URL</span> -->
    <!-- <span class="label-text-alt">Bottom Right label</span> -->
    <!-- </div> -->
    <!-- </label> -->
  </div>
<!--{/if} -->
