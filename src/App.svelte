<script>
	import FormComp from './form.svelte'
	import Card from './card.svelte'
	import {emailsData} from './store.js'
</script>


<style>
	.main {
		text-align: center;
		padding: 1vw;
		max-width: 80vw;
		margin: 0 auto;
	}

	h1 {
		color: #253a96;
		font-size: 4em;
		font-weight: bold;
	}
</style>

<div class="main">
	<h1>Email List</h1>
	<FormComp />
	{#each $emailsData as email}
		<Card email={email} />	
	{/each}
</div>