<script>
	const unauthorized = (() => {
		console.log('unauthorized')
	})
	const crash = (() => {
		console.log('crash')
	})
</script>

<section class="container">
	<div class="page">
		<h1>{ $_('pages.title') } ADMIN</h1>

		<p><a href="/dead-link">{ $_('pages.server_404') }</a></p>
		<p><a href="/dead-link">{ $_('pages.client_404') }</a></p>
		<p><a on:click={unauthorized} href={'#'}>{ $_('pages.server_401') }</a></p>
		<p><a on:click={crash} href="/admin">{ $_('pages.server_500') }</a></p>
		<br />
		<b><a on:click|preventDefault={
			() => {window.location.href = '/admin'}
			} href="/admin">{ $_('pages.admin_link') }</a></b>
	</div>
</section>