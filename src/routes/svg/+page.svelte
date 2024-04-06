<script>
  import svgs from '$lib/icones.json';
  import { copy } from 'svelte-copy';

  let textBox;

  // Sort by name in ascending order
  //svgs.sort((a, b) => a.name.localeCompare(b.name));

  // Parse the JSON data
  //let jsonData = JSON.parse(svgs);

  // Function to recursively find and replace values
  function findAndReplace(object, pattern, replaceValue) {
    const regex = new RegExp(pattern, 'g'); // 'g' for global replacement
    for (let key in object) {
      if (typeof object[key] === 'object') {
        findAndReplace(object[key], pattern, replaceValue);
      } else if (typeof object[key] === 'string') {
        object[key] = object[key].replace(regex, replaceValue);
      }
    }
  }

  let oldValue = 'width="1em" height="1em"'; // No need to escape quotes in template literals
  let newValue = 'class="h-6 w-6"';

  // Example usage: Replace 'oldValue' with 'newValue'
  findAndReplace(svgs, oldValue, newValue);

  // Convert the modified object back to JSON
  // const updatedJson = JSON.stringify(svgs, null, 2);

  let desiredName = 'ion:settings';
  let descValue = svgs.find((obj) => obj.name === desiredName).svg;

  function selectText() {
    // event.target.select();
    textBox.select();
  }
</script>

<!--
<div class="my-6 mx-8 relative">
 <textarea bind:this={textBox} class="textarea textarea-bordered h-40 text-[0.4rem]/[0.6rem] w-full" placeholder="">{descValue}</textarea>
 <div class="tooltip tooltip-left" data-tip="copied!">
    <button on:click={selectText} use:copy={descValue} class="btn button absolute right-0 top-0 m-2">copy</button>
 </div>
</div>
-->

<div class="mx-8 my-6 grid grid-cols-2 gap-4">
  {#each svgs as svg}
    <div class="flex h-full flex-col rounded-md bg-blue-100 shadow-md">
      <div class="pb-2">
        <p class="m-2 text-sm">{svg.name}</p>
      </div>
      <!-- Assuming 'svg' contains SVG code, you can use @html to render it -->
      <div class="b-2 mx-auto flex items-end py-4">
        <div class="tooltip" data-tip="{svg.name} copied!">
          <button
            use:copy={svg.svg}
            class="btn btn-circle bg-slate-300 text-slate-700"
          >
            {@html svg.svg}
          </button>
        </div>
      </div>
    </div>
  {/each}
</div>
