import { writable } from 'svelte/store';

export let viewportWidth = writable(0);
export let viewportHeight = writable(0);

export const viewport = writable({
	width: 0,
	height: 0
});
