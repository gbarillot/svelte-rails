<script>
	import { Api } from '@/apps/front/stores/movies'	
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
		<h1>{ $_('pages.title') }</h1>

		<p><a on:click|preventDefault={notFound} href="#">{ $_('pages.server_404') }</a></p>
		<p><a href="/dead-link">{ $_('pages.client_404') }</a></p>
		<p><a on:click|preventDefault={unauthorized} href={'#'}>{ $_('pages.server_401') }</a></p>
		<p><a on:click|preventDefault={crash} href="#">{ $_('pages.server_500') }</a></p>
		<br />
		<b><a on:click|preventDefault={goAdmin} href="{window.I18n.prefix + '/admin/'}">{ $_('pages.admin_link') }</a></b>
	</div>
</section>