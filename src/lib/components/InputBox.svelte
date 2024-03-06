<script>
 import { createEventDispatcher } from 'svelte';
 const dispatch = createEventDispatcher();

 let youtubeUrl = '';

 function handleInput(event) {
    youtubeUrl = event.target.value;
    dispatch('urlChange', youtubeUrl);
 }
</script>

<input type="text" bind:value={youtubeUrl} on:input={handleInput} placeholder="Enter YouTube URL">
