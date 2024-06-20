import { get } from 'svelte/store';
import  { videoId } from '$lib/stores/store.js';

  let color = null;
  
  let thumbnailUrl = `https://img.youtube.com/vi/${videoId}/hqdefault.jpg`;
  

export const load = async ({ fetch, params }) => {
   
  const colorRes = await fetch(`/api/color?${new URLSearchParams({
   image: thumbnailUrl
  }).toString()}`
  );
  if(colorRes.ok) {
    color = (await colorRes.json()).color;
  };
  
  return {
      color
  }
}