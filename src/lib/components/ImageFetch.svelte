<script>
  import { onMount } from 'svelte';
  import { videoId } from '$lib/stores/store.js'
  import Grade from 'grade-js';

  let color1, color2, gradientWrap;
  let imageUrl = '';

  $: console.log(`color1: ${color1}`)
  
  onMount(async () => {
    imageUrl = `https://img.youtube.com/vi/${$videoId}/hqdefault.jpg`;
    const response = await fetch(imageUrl);
    const blob = await response.blob();
    imageUrl = URL.createObjectURL(blob);

    // Try conditional import of grade-js
   // const { default: Grade } = await import('grade-js');
    
    Grade(
            document.querySelectorAll('.gradient-wrap'),
            null,
            function (gradientData) {
      
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


  });
</script>

<img src={imageUrl} alt="Fetched Image" />

<div class="gradient-wrap size-20" bind:this={gradientWrap}>
  <img src={imageUrl} />
</div>
