<!-- <script>
 export let videoId = '';
</script>

<iframe
 width="560"
 height="315"
 src={`https://www.youtube.com/embed/${videoId}`}
 frameborder="0"
 allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
 allowfullscreen
></iframe>
-->
<script>
	import { onMount } from 'svelte';

	export const videoUrl = 'https://youtu.be/M7lc1UVf-VE'; // Example YouTube video ID
	let player;

	const urlToParse = new URL(videoUrl);

	const searchParams = urlToParse.searchParams;
	const query = searchParams.get('query'); // "param"
	console.log(query);

	const pathSegments = urlToParse.pathname.split('/');
	const lastSegment = pathSegments[pathSegments.length - 1]; // "path"
	const videoId = lastSegment;
	console.log(lastSegment);

	onMount(() => {
		const windowRef = window;
		if (typeof windowRef.YT !== 'undefined') {
			player = new windowRef.YT.Player('player', {
				height: '390',
				width: '640',
				videoId: videoId,
				playerVars: {
					playsinline: 1
				},
				events: {
					onReady: (event) => {
						event.target.playVideo();
					},
					onStateChange: (event) => {
						// Handle state changes if needed
					}
				}
			});
		}
	});
</script>

<div id="player"></div>
