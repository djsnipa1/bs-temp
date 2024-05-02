<script>
  import { isControlsOpen } from '$lib/stores/store.js';
  import { createEventDispatcher } from 'svelte';

  const dispatch = createEventDispatcher();

  function onClick() {
    dispatch('click');
  }
</script>

<button
  class="glass-button button rounded-md p-2 text-slate-900 shadow-md transition hover:scale-110 hover:text-slate-600 active:scale-90"
  {...$$restProps}
  on:click={onClick}
>
  <slot />
</button>

<style>
  .glass-button {
    /* display: inline-block; */
    border: 0;
    text-decoration: none;
    /* border-radius: 15px; */
    background-color: rgba(255, 255, 255, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(30px);
    color: rgba(255, 255, 255, 0.8);
    /* font-size: 14px; */
    /* letter-spacing: 2px; */
    cursor: pointer;
    /* text-transform: uppercase; */
  }

  .glass-button:hover {
    background-color: rgba(255, 255, 255, 0.2);
  }
</style>
