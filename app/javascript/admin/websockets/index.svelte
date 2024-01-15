<script>
	import { Api } from '@/front/stores/musicians'	
	import { Link } from '@gbarillot/svelte-router'
	
	const notFound = (() => {
		$Api.show('404');   
	})
	const unauthorized = (() => {
		$Api.show('this-will-trigger-a-401');   
	})
	const crash = (() => {
		$Api.show('this-will-trigger-a-500'); 
	})
	const goAdmin = (() => {
		window.location.href = '/admin/'
	})
</script>

<section class="container">
	<div class="page">
		<h1>Websockets</h1>
	</div>
</section>