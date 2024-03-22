<script>


</script>

<div class="neomorph h-6 w-6 rounded-md mx-auto flex items-center">
<p class="text-xs text-slate-800  mx-auto flex justify-center items-center">
<slot />
</p>
</div>


<style>
.neomorph {
	box-shadow:  inset -1px -1px 3px rgba(255, 255, 255, 0.10),
        inset 1px 1px 3px rgba(0,0,0,0.40);
}
/*:root {
	--primary: #6441a5;
	--white: #ffffff;
	--greyLight-1: #e4ebf5; 
	--greyLight-2: #c8d0e7;  *
	--shadow: 0.3rem 0.3rem 0.6rem var(--greyLight-2),
		-0.2rem -0.2rem 0.5rem var(--white);
	--inner-shadow: inset 0.2rem 0.2rem 0.5rem var(--greyLight-2),
		inset -0.2rem -0.2rem 0.5rem var(--white);
}

* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}
/*body {
	background: var(--greyLight-1);
} 
div {
	display: flex;
	align-items: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

*/
</style>