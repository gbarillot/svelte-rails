<script>
	import { router, Link } from '@gbarillot/svelte-router'
	import { Store, Api } from '@/admin/stores/musicians'	
	import MusicianForm from './_form.svelte'	

	function create() {
		$Api.create();
	}
	onMount(() => {
		$Api.new();
	});
</script>

<section class="container">
	<ul class="breadcrumb">
		<li><Link to="root">{ $_('title') }</Link></li>
		<li><Link to="musicians">{ $_('nav.musicians') }</Link></li>
		<li><span>{ $_('musicians.new') }</span></li>
	</ul>

	<form on:submit|preventDefault={create} class="card" class:loading={$Store.progress === 'loading'}>
		<MusicianForm musician={$Store.musician} bands={$Store.bands} errors={$Store.errors} /> 

		<div class="row">
			<div class="col-xs-12 col-sm-4 col-md-3 col-lg-2 ta-right">
				<input type="submit" value={ $_('save') } />      
			</div>
		</div>
	</form> 

	<div class="row">
		<div class="col-xs-12">
			<p>{ $_('musicians.comment') }</p>
		</div>
	</div>
</section>
