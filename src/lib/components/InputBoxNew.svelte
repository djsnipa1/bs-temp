<script>
import { videoId } from '$lib/stores/YoutubeURL.js';

  $: currentBind = '';
  let newId;
  
  function getYouTubeID(url) {
    // Define a regular expression to match different YouTube URL formats
    var regex = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#&?]*).*/;
    // Use the match() method to extract the video ID
    var match = String(url).match(regex);
    // Check if the match is valid and the ID is 11 characters long
    if (match && match[7].length == 11) {
      // Return the video ID
      return match[7];
    } else {
      // Return an empty string or an error message
      return "";
    }
  }

  const handleInput = (e) => {
    newId = getYouTubeID(e.target.value);
    console.log(newId);
    videoId.set(newId);
  }

  // function handleInput(e) {
  //  newId = getYouTubeID(e);
    
  //   console.log(newId);
  //   // update the todo store using set or update
  //   videoId.set(newId);
  //   return
  // }
  
  // Test the function with some sample URLs
  console.log(getYouTubeID("https://www.youtube.com/watch?v=qeMFqkcPYcg")); // qeMFqkcPYcg
  console.log(getYouTubeID("https://youtu.be/qeMFqkcPYcg")); // qeMFqkcPYcg
  console.log(getYouTubeID("https://www.youtube.com/embed/qeMFqkcPYcg")); // qeMFqkcPYcg
  console.log(getYouTubeID("https://www.youtube.com/v/qeMFqkcPYcg")); // qeMFqkcPYcg
  console.log(getYouTubeID("https://www.youtube.com/watch?v=invalid")); // ""
console.log(getYouTubeID("https://youtu.be/m_xoN8KlP3w"));
</script>

<input class="input input-bordered input-sm w-full max-w-xs" type="text" bind:value={currentBind} on:input={e => handleInput(e)} placeholder="Enter YouTube URL" />

<input type="text" placeholder={$videoId || "Youtube URL here"} bind:value={currentBind} on:input={e => getYouTubeID(e)} class="input input-bordered input-sm w-full max-w-xs" /> 

  <p>cur {currentBind}</p>
