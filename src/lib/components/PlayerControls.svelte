<script>
  import {
    isUrlOpen,
    videoId,
    menuOpen,
    isVideoPlaying,
    isVideoPaused
  } from '$lib/stores/store.js';
</script>

<div
  class="glass mx-auto grid h-[200px] w-[200px] grid-cols-7 grid-rows-3 items-center justify-items-center gap-4 rounded-full border border-black"
>
  <button class="buttonClass group col-span-2 col-start-2">
    <span class="spanClass">FB</span>
    <svg
      xmlns="http://www.w3.org/2000/svg"
      class="svgClass mr-1"
      viewBox="0 0 24 24"
      ><g fill="none" fill-rule="evenodd"
        ><path
          d="M24 0v24H0V0zM12.593 23.258l-.011.002l-.071.035l-.02.004l-.014-.004l-.071-.035c-.01-.004-.019-.001-.024.005l-.004.01l-.017.428l.005.02l.01.013l.104.074l.015.004l.012-.004l.104-.074l.012-.016l.004-.017l-.017-.427c-.002-.01-.009-.017-.017-.018m.265-.113l-.013.002l-.185.093l-.01.01l-.003.011l.018.43l.005.012l.008.007l.201.093c.012.004.023 0 .029-.008l.004-.014l-.034-.614c-.003-.012-.01-.02-.02-.022m-.715.002a.023.023 0 0 0-.027.006l-.006.014l-.034.614c0 .012.007.02.017.024l.015-.002l.201-.093l.01-.008l.004-.011l.017-.43l-.003-.012l-.01-.01z"
        /><path
          fill="currentColor"
          d="M19.788 5.627c.777-.359 1.68.204 1.783 1.114l.027.25l.062.653l.065.845l.044.751l.026.554l.02.593l.016.631l.008.667v.683l-.008.647l-.023.907l-.022.56l-.04.767l-.062.88l-.062.705l-.054.517c-.1.866-.943 1.372-1.714 1.018l-.608-.29l-.315-.157l-.545-.28l-.408-.218l-.442-.242l-.474-.267l-.503-.292l-.532-.318l-.558-.344l-.69-.439l-.635-.42l-.58-.397l-.525-.37l-.24-.174l-.04.86l-.049.755l-.067.835l-.062.62l-.013.12c-.1.866-.943 1.372-1.714 1.018l-.608-.29l-.315-.157l-.545-.28l-.408-.218l-.442-.242l-.722-.41l-.518-.305a47.459 47.459 0 0 1-.27-.162l-.557-.344l-.58-.368l-.275-.179l-.523-.348l-.485-.331l-.446-.314l-.594-.43l-.344-.258l-.562-.435l-.308-.247c-.67-.546-.686-1.592-.042-2.117l.432-.345l.607-.465l.367-.271l.407-.294l.684-.479l.503-.34l.54-.353l.575-.366l.573-.353l.277-.166l.533-.313l.503-.286l.47-.26l.436-.234l.757-.39l.589-.287l.225-.105c.777-.359 1.68.204 1.783 1.114l.045.427l.051.558l.052.68l.048.797l.028.592l.492-.353c.173-.123.356-.25.547-.38l.599-.403a46.8 46.8 0 0 1 .992-.638l.573-.353l.277-.166l.533-.313l.503-.286l.47-.26l.436-.234l.757-.39l.589-.287z"
        /></g
      ></svg
    >
  </button>
  <button class="buttonClass group col-span-2 col-start-5">
    <span class="spanClass group-hover:">FF</span>
    <svg xmlns="http://www.w3.org/2000/svg" class="svgClass" viewBox="0 0 24 24"
      ><g fill="none" fill-rule="evenodd"
        ><path
          d="M24 0v24H0V0zM12.593 23.258l-.011.002l-.071.035l-.02.004l-.014-.004l-.071-.035c-.01-.004-.019-.001-.024.005l-.004.01l-.017.428l.005.02l.01.013l.104.074l.015.004l.012-.004l.104-.074l.012-.016l.004-.017l-.017-.427c-.002-.01-.009-.017-.017-.018m.265-.113l-.013.002l-.185.093l-.01.01l-.003.011l.018.43l.005.012l.008.007l.201.093c.012.004.023 0 .029-.008l.004-.014l-.034-.614c-.003-.012-.01-.02-.02-.022m-.715.002a.023.023 0 0 0-.027.006l-.006.014l-.034.614c0 .012.007.02.017.024l.015-.002l.201-.093l.01-.008l.004-.011l.017-.43l-.003-.012l-.01-.01z"
        /><path
          fill="currentColor"
          d="m13.212 5.627l.356.168l.458.224l.553.283l.417.22l.693.38l.503.287l.533.313l.56.34c.096.058.192.118.29.179l.575.366l.54.353l.503.34l.466.324l.625.449l.367.27l.607.466l.432.345c.644.525.627 1.57-.043 2.117l-.307.247l-.562.435l-.73.54l-.426.302l-.465.323l-.505.34a47.21 47.21 0 0 1-.266.176l-.56.362l-.295.185l-.558.344l-.532.318l-.503.292l-.474.267l-.442.242l-.599.317l-.354.181l-.712.348l-.21.099c-.772.354-1.616-.152-1.715-1.018l-.075-.74l-.068-.834l-.032-.492l-.03-.54l-.026-.583l-.496.355l-.269.189l-.58.396l-.636.42l-.689.44l-.558.343l-.787.467l-.722.41l-.442.242l-.599.317l-.354.181l-.712.348l-.21.099c-.772.354-1.616-.152-1.715-1.018l-.054-.517l-.062-.705l-.061-.88l-.04-.768l-.023-.56l-.023-.906l-.008-.647v-.683l.008-.667l.015-.631l.034-.875l.042-.783l.064-.891l.048-.546l.044-.433l.013-.118c.103-.91 1.006-1.473 1.783-1.114l.356.168l.458.224l.553.283l.417.22l.454.247l.487.274l.255.146l.533.313l.56.34a46.884 46.884 0 0 1 1.588 1.021l.574.392l.52.368l.24.173l.027-.592l.03-.544l.052-.72l.068-.772l.045-.427c.103-.91 1.006-1.473 1.783-1.114"
        /></g
      ></svg
    >
  </button>
  <button
    class="col-span-2 row-start-2 flex h-12 w-12 items-center justify-center rounded-full bg-slate-400"
    >REV</button
  >
  {#if !$isVideoPlaying}
    <button
      on:click={() => {
        isVideoPlaying.set(true);
      }}
      class="relative col-span-3 col-start-3 row-start-2 flex flex h-16 w-16 flex-col items-center items-center justify-center justify-center rounded-full bg-slate-400 transition-all hover:bg-slate-300 hover:text-slate-600"
      ><span class="absolute z-10 w-full text-center">PLAY</span>
      <svg
        class="absolute z-0 h-12 w-12 text-slate-300 transition-all active:opacity-0"
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 24 24"
        ><g fill="none" fill-rule="evenodd"
          ><path
            d="M24 0v24H0V0zM12.593 23.258l-.011.002l-.071.035l-.02.004l-.014-.004l-.071-.035c-.01-.004-.019-.001-.024.005l-.004.01l-.017.428l.005.02l.01.013l.104.074l.015.004l.012-.004l.104-.074l.012-.016l.004-.017l-.017-.427c-.002-.01-.009-.017-.017-.018m.265-.113l-.013.002l-.185.093l-.01.01l-.003.011l.018.43l.005.012l.008.007l.201.093c.012.004.023 0 .029-.008l.004-.014l-.034-.614c-.003-.012-.01-.02-.02-.022m-.715.002a.023.023 0 0 0-.027.006l-.006.014l-.034.614c0 .012.007.02.017.024l.015-.002l.201-.093l.01-.008l.004-.011l.017-.43l-.003-.012l-.01-.01z"
          /><path
            fill="currentColor"
            d="M5.669 4.76a1.469 1.469 0 0 1 2.04-1.177c1.062.454 3.442 1.533 6.462 3.276c3.021 1.744 5.146 3.267 6.069 3.958c.788.591.79 1.763.001 2.356c-.914.687-3.013 2.19-6.07 3.956c-3.06 1.766-5.412 2.832-6.464 3.28c-.906.387-1.92-.2-2.038-1.177c-.138-1.142-.396-3.735-.396-7.237c0-3.5.257-6.092.396-7.235"
          /></g
        ></svg
      >
    </button>
  {/if}
  {#if $isVideoPlaying}
    <button
      on:click={() => {
        isVideoPaused.set(true);
      }}
      class="col-span-3 col-start-3 row-start-2 flex h-16 w-16 items-center justify-center rounded-full bg-slate-400 transition-all hover:bg-slate-300 hover:text-slate-600"
      >PAUSE</button
    >
  {/if}
  <button
    class="col-span-2 col-start-6 row-start-2 flex h-12 w-12 items-center justify-center rounded-full bg-slate-400 hover:bg-slate-300 hover:text-slate-600"
    >FWD</button
  >
  <button
    class="col-span-2 col-start-2 row-start-3 flex h-12 w-12 items-center justify-center rounded-full bg-slate-400"
    >BACK</button
  >
  <button
    class="col-span-2 col-start-5 row-start-3 flex h-12 w-12 items-center justify-center rounded-full bg-slate-400"
    >STOP</button
  >
</div>

<style>
  .buttonClass {
    @apply relative flex flex h-10 w-10 transform-gpu flex-col items-center items-center justify-center justify-center rounded-full bg-black hover:scale-[120%] hover:text-slate-600 hover:transition-all transition-all hover:duration-300 duration-300 border-[#265ad8] border-[5px];
  }

  .spanClass {
    @apply absolute z-10 w-full transform-gpu text-center font-sofiasans font-normal text-base text-slate-700 group-hover:scale-[80%] group-hover:transition-all transition-all group-hover:duration-300 duration-300;
  }

  .svgClass {
    @apply absolute z-0 h-6 w-6 text-slate-300 transition-all group-hover:text-amber-400 group-focus:text-blue-400 group-active:text-amber-400;
  }
  
    .shadow-sharp {
    box-shadow:
      0 1px 1px rgba(0, 0, 0, 0.25),
      0 2px 2px rgba(0, 0, 0, 0.2),
      0 4px 4px rgba(0, 0, 0, 0.15),
      0 8px 8px rgba(0, 0, 0, 0.1),
      0 16px 16px rgba(0, 0, 0, 0.05);
  }
  .shadow-diffuse {
    box-shadow:
      0 1px 1px rgba(0, 0, 0, 0.08),
      0 2px 2px rgba(0, 0, 0, 0.12),
      0 4px 4px rgba(0, 0, 0, 0.16),
      0 8px 8px rgba(0, 0, 0, 0.2);
  }
</style>
