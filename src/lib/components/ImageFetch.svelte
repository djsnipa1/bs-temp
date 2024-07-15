<script>
  import { onMount } from 'svelte';
  import { browser } from '$app/environment';
  import { videoId } from '$lib/stores/store.js';
  // import Grade from 'grade-js';
  //import { getDominantColors, getImageBufferCanvas, rgbToHex } from 'color-supreme'
  /* let colorSupreme;
  (async () => {
      colorSupreme = await import('color-supreme');
      const { getDominantColors, getImageBufferCanvas, rgbToHex } = colorSupreme;
  })();
*/

  let backgroundImage;

  async function fetchAndEncodeImage(imageUrl) {
    try {
      const response = await fetch(imageUrl);
      const blob = await response.blob();
      return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.onloadend = () => {
          resolve(reader.result);
        };
        reader.onerror = reject;
        reader.readAsDataURL(blob);
      });
    } catch (error) {
      console.error('Error fetching or encoding image:', error);
      throw error;
    }
  }

  import { getDominantColors, rgbToHex } from 'color-supreme';
  import { getImageFromUrl } from 'pixel-paradise';

  let color1, color2, gradientWrap;
  let imageUrl = '';

  onMount(async () => {
    // $: console.log(`color1: ${color1}`)

    imageUrl = `https://img.youtube.com/vi/${$videoId}/hqdefault.jpg`;

    const getColors = async (url, colors = 5) => {
      const pixels = await getImageFromUrl(url);
      return getDominantColors(pixels, colors).map(rgbToHex);
    };

    getColors(imageUrl).then(console.log);

    /*   
    const response = await fetch(imageUrl);
    const blob = await response.blob();
    imageUrl = URL.createObjectURL(blob);
*/

    // Try conditional import of grade-js
    // const { default: Grade } = await import('grade-js');
    /*   
    Grade(
            document.querySelectorAll('.gradient-wrap'),
            null,
            function (gradientData) {
     */
    // This section is so I could download the gradientData JSON to text file
    /*        function download(content, fileName, contentType) {
                var a = document.createElement('a');
                var file = new Blob([content], { type: contentType });
                a.href = URL.createObjectURL(file);
                a.download = fileName;
                a.click();
              }
              download(JSON.stringify(gradientData), 'json.txt', 'text/plain');
    */
    /*
              [color1, color2] = gradientData[0].gradientData.map((item) => {
                const [r, g, b, a] = item.rgba;
                return { r, g, b, a };
              });

              console.log(color1);
  
            },
          );

          Grade(document.querySelectorAll('.gradient-wrap'));
//Grade(gradientWrap)
          const finalColor1 = `rgba(${color1.r}, ${color1.g}, ${color1.b}, ${color1.a})`;

          console.log(finalColor1);
*/

    backgroundImage = await fetchAndEncodeImage(imageUrl);
  });
</script>

<div style="background-image: url({backgroundImage});">
  <!-- Your content here -->
</div>

<!-- <img src={imageUrl} alt="Fetched Image" /> -->

<!-- <div class="gradient-wrap size-20" bind:this={gradientWrap}>
  <img src={imageUrl} />
</div> -->
