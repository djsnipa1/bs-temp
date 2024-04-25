import { writable } from 'svelte/store';

export const youtubeUrl = writable('https://youtu.be/9B1SQX9a_hU');

// export const videoId = writable('M7lc1UVf-VE');
export const videoId = writable('9B1SQX9a_hU');

export const cssPosition = writable('');

export const isControlsOpen = writable(false);

export const isUrlOpen = writable(false);

export const menuOpen = writable(false);

export const isVideoPlaying = writable(null);

export const isVideoPaused = writable(null);

export const playerControlAnimOver = writable(false);
