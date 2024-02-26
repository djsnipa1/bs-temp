To display only a portion of a video, such as the left, center, or right  1/3 of the video, you can use CSS to achieve this effect. The key properties you'll use are `object-fit` and `object-position`. The `object-fit` property controls how the video's size is adjusted to fit within the frame, and `object-position` allows you to adjust the positioning of the video within the element's frame.

Here's a step-by-step guide on how to implement this:

1. **Wrap the Video Element**: First, wrap your `<video>` element in a container div. This container will help you control the size and positioning of the video.

```html
<div class="video-container">
  <video id="myVideo" src="your-video.mp4"></video>
</div>
```

2. **Style the Container and Video**: Use CSS to set the size of the container and the video. For the video, you'll want to use `object-fit: cover;` to ensure the video covers the container without distorting its aspect ratio. Then, use `object-position` to control which part of the video is visible.

- **Left  1/3**: To show the left  1/3 of the video, you can set the `object-position` to `0%  50%`.
- **Center  1/3**: For the center  1/3, set `object-position` to `33%  50%`.
- **Right  1/3**: To display the right  1/3, use `object-position` at `66%  50%`.

```css
.video-container {
  width:  100%; /* Adjust the width as needed */
  height:  0;
  padding-bottom:  100%; /* Maintain aspect ratio */
  position: relative;
  overflow: hidden; /* Hide the parts of the video outside the container */
}

#myVideo {
  width:  100%;
  height:  100%;
  position: absolute;
  object-fit: cover;
  /* Adjust object-position based on which part of the video you want to show */
  object-position:  0%  50%; /* For left  1/3 */
}
```

3. **Adjust CSS Based on Desired Portion**: Change the `object-position` value in the `#myVideo` CSS rule to adjust which part of the video is visible.

- **Left  1/3**: `object-position:  0%  50%;`
- **Center  1/3**: `object-position:  33%  50%;`
- **Right  1/3**: `object-position:  66%  50%;`

This approach allows you to control the portion of the video displayed by adjusting the `object-position` property. Remember, the `object-position` property uses percentages to position the video within the container, with `0%  0%` being the top-left corner and `100%  100%` being the bottom-right corner. By setting the horizontal value to `33%` or `66%` and the vertical value to `50%`, you're effectively showing the left, center, or right third of the video.