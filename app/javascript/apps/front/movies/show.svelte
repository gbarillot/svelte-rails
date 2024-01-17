<script>
	import { router, Link } from '@gbarillot/svelte-router'
	import { Store, Api } from '@/apps/front/stores/movies'	

	onMount(async () => {
		$Api.show($router.params.id);
	});
</script>

<div class="container">
  <section class="container">
    <h1>{ $_('home.title') }</h1>

     <ul class="breadcrumb">
      <li><Link to="root" params={{id: 123}} attrs={{class: 'one two'}}>{ $_('home.breadcrumb') }</Link></li>
      <li>{ $Store.movie.name }</li>
    </ul>

		<div class="page">
			<h2>{ $_('movies.title') }</h2>
			{#if $Store.movie.id != null}
				<p>
					<b>{ $_('movies.id') }:</b> { $Store.movie.id }<br />
					<b>{ $_('movies.name') }:</b> { $Store.movie.name }<br /> 
					<b>{ $_('movies.band') }:</b> { $Store.movie.band }
				</p>
			{/if}
		</div>
		
  </section>
</div>
