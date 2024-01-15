<script>
	import { router, Link } from '@gbarillot/svelte-router'
	import { Api, Store } from '@/admin/stores/musicians'	
	import  Filters  from './_filters.svelte'	

	onMount(() => {
		//console.log();
		$Api.index($router.fullPath);
	});
</script>

<section class="container">
	<div class="row">
		<div class="col-xs-12 col-lg-8 col-xl-9">      
			<ul class="breadcrumb">
				<li><Link to="root">{ $_('title') }</Link></li>
				<li>{ $_('nav.musicians') }</li>
			</ul>
		</div>
		<div class="col-xs-12 col-lg-4 col-xl-3 ta-right">
			<Link to="new_musician" role="button" class="outline" style="width: 100%">{ $_('musicians.create') }</Link> 
		</div>
	</div>

	<Filters bands={$Store.bands} />

	<div>
		<table>
			<thead>
				<tr>
					<th>{ $_('musicians.form.id') }</th>
					<th>{ $_('musicians.form.name') }</th>
					<th>{ $_('musicians.form.band') }</th>
				</tr>
			</thead>
			<tbody>
				{#each $Store.musicians as musician}
				<tr>
					<td><Link to="musician", params={{id: musician.id}}>{ musician.id }</Link></td>
					<td><Link to="musician", params={{id: musician.id}}>{ musician.name }</Link></td>
					<td><Link to="musician", params={{id: musician.id}}>{ musician.band }</Link></td>
				</tr>
				{/each}
			</tbody>
		</table>
		<!-- <div v-else>
			<h3 class="card ta-center">{ $t('no_result') }</h3>
		</div> -->

		<!-- <pagination v-if="store.pagination" :store="store" @clicked="index"></pagination> -->
	</div>
</section>
