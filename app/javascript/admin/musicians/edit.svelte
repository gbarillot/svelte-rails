<script>
	import { router, Link } from '@gbarillot/svelte-router'
	import { Store, Api } from '@/admin/stores/musicians'	
	import MusicianForm from './_form.svelte'	

	//console.log($router);

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

<section class="container">
	<ul class="breadcrumb">
		<li><Link to="root">{ $_('title') }</Link></li>
		<li><Link to="musicians">{ $_('nav.musicians') }</Link></li>
		<li>{ $Store.musician.name }</li>
	</ul>

	<form on:submit|preventDefault={update} class="card" class:loading={$Store.progress === 'loading'}>
		<MusicianForm musician={$Store.musician} bands={$Store.bands} errors={$Store.errors} /> 

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
			<p>{ $_('musicians.comment') }</p>
		</div>
	</div>
</section>
