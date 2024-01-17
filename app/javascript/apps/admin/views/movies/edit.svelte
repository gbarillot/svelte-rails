<script>
	import { router, Link } from '@gbarillot/svelte-router'
	import { Store, Api } from '../../stores/movies'	
	import MovieForm from './_form.svelte'	

	function update() {
		$Api.update($router.params.id);
	}
	function destroy() {
		$Api.destroy($router.params.id);
	}
	onMount(() => {
		$Api.edit($router.params.id);
	});
</script>

<section class="container movies">
	<ul class="breadcrumb">
		<li><Link to="root">{ $_('title') }</Link></li>
		<li><Link to="movies">{ $_('nav.movies') }</Link></li>
		<li>{ $Store.movie.name }</li>
	</ul>

	<form on:submit|preventDefault={update} class="card" class:loading={$Store.progress === 'loading'}>
		<MovieForm movie={$Store.movie} genres={$Store.genres} errors={$Store.errors} /> 

		<div class="row">
			<div class="col-xs-12 col-sm-8 col-md-9 col-lg-10 hidden-xs">
				<a on:click|preventDefault={destroy} href="#/" role="button" class="secondary outline">{ $_('delete') }</a> 
			</div>
			<div class="col-xs-12 col-sm-4 col-md-3 col-lg-2 ta-right">
				<input type="submit" value={ $_('save') } />      
			</div>
			<a on:click|preventDefault={destroy} href="#/" class="visible-xs">{ $_('delete') }</a>
		</div>
	</form> 

	<div class="row">
		<div class="col-xs-12">
			<p>{ $_('movies.comment') }</p>
		</div>
	</div>
</section>
