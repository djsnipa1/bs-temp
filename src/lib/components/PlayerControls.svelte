<script>
  import { isUrlOpen, videoId, menuOpen } from '$lib/stores/store.js';
</script>

<div
  class="glass mx-auto grid h-[200px] w-[200px] grid-cols-7 grid-rows-3 items-center justify-items-center gap-4 rounded-full border border-black text-slate-700"
>
  <button
    class="col-span-2 col-start-2 flex h-12 w-12 items-center justify-center rounded-full bg-slate-300"
    >FB</button
  >
  <button
    class="col-span-2 col-start-5 flex h-12 w-12 items-center justify-center rounded-full bg-slate-300"
    >FF</button
  >
  <button
    class="col-span-2 row-start-2 flex h-12 w-12 items-center justify-center rounded-full bg-slate-300"
    >REV</button
  >
  <button
    class="col-span-3 col-start-3 row-start-2 flex h-16 w-16 items-center justify-center rounded-full bg-slate-300"
    >PLAY</button
  >
  <button
    class="col-span-2 col-start-6 row-start-2 flex h-12 w-12 items-center justify-center rounded-full bg-slate-300"
    >FWD</button
  >
  <button
    class="col-span-2 col-start-2 row-start-3 flex h-12 w-12 items-center justify-center rounded-full bg-slate-300"
    >BACK</button
  >
  <button
    class="col-span-2 col-start-5 row-start-3 flex h-12 w-12 items-center justify-center rounded-full bg-slate-300"
    >STOP</button
  >
</div>
