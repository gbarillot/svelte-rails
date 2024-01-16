<script>
	import { router, Link } from '@gbarillot/svelte-router'
	import { Api, Store } from '@/admin/stores/musicians'	
	import  Filters  from './_filters.svelte'	
	import  Pagination  from '../shared/_pagination.svelte'	

	function load() {
		console.log('load')
		$Api.index($router.fullPath);
	}
	function filter() {
		load();
	}
	onMount(() => {
		load();
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
			<Link to="new_musician" attrs={{class: "outline", role: "button", style: "width: 100%"}}>{ $_('musicians.create') }</Link> 
		</div>
	</div>

	<Filters bands={$Store.bands} callback={filter} />

	<div>
		{#if $Store.musicians.length > 0}
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
		{:else}
			<h3 class="card ta-center">{ $_('no_result') }</h3>
		{/if}

		<Pagination pagination={$Store.pagination} callback={load} />
	</div>
</section>
