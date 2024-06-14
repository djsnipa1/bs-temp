import { quintOut } from 'svelte/easing';

export function circleTransition(node, { duration = 1000 }) {
    //const o = +getComputedStyle(node).clipPath;

    return {
      duration,
      easing: quintOut,
      css: (t) => `clip-path: circle(${t * 100}% at center);`
    };
  }