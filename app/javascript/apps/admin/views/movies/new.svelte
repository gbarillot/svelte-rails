<script>
	import { router, Link } from '@gbarillot/svelte-router'
	import { Store, Api } from '../../stores/movies'	
	import MovieForm from './_form.svelte'	

	function create() {
		$Api.create();
	}
	onMount(() => {
		$Api.new();
	});
</script>

<section class="container movies">
	<ul class="breadcrumb">
		<li><Link to="root">{ $_('title') }</Link></li>
		<li><Link to="movies">{ $_('nav.movies') }</Link></li>
		<li><span>{ $_('movies.new') }</span></li>
	</ul>

	<form on:submit|preventDefault={create} class="card" class:loading={$Store.progress === 'loading'}>
		<MovieForm movie={$Store.movie} genres={$Store.genres} errors={$Store.errors} /> 

		<div class="row">
			<div class="col-xs-12 col-sm-4 col-md-3 col-lg-2 ta-right">
				<input type="submit" value={ $_('save') } />      
			</div>
		</div>
	</form> 

	<div class="row">
		<div class="col-xs-12">
			<p>{ $_('movies.comment') }</p>
		</div>
	</div>
</section>
