import { get } from 'svelte/store';
import { videoId } from '$lib/stores/store.js';

let color, vibrantColors = null;

let thumbnailUrl = `https://img.youtube.com/vi/${videoId}/hqdefault.jpg`;

export const load = async ({ fetch, params }) => {
  const colorRes = await fetch(
    `/api/color?${new URLSearchParams({
      image: thumbnailUrl
    }).toString()}`
  );
  if (colorRes.ok) {
    const colorJson = (await colorRes.json());
   // color = (await colorRes.json()).color;
 //   vibrantColors = (await colorRes.json()).vibrantColors;
    color = colorJson.color;
    vibrantColors = colorJson.vibrantColors;
    console.log(vibrantColors)
  }

  return {
    color,
    vibrantColors
  };
};
