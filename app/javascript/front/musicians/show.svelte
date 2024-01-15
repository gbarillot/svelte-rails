<script>
	import { router, Link } from '@gbarillot/svelte-router'
	import { Store, Api } from '@/front/stores/musicians'	

	onMount(async () => {
		$Api.show($router.params.id);
	});
</script>

<div class="container">
  <section class="container">
    <h1>{ $_('home.title') }</h1>

     <ul class="breadcrumb">
      <li><Link to="root" params={{id: 123}} attrs={{class: 'one two'}}>{ $_('home.breadcrumb') }</Link></li>
      <li>{ $Store.musician.name }</li>
    </ul>

		<div class="page">
			<h2>{ $_('musicians.title') }</h2>
			{#if $Store.musician.id != null}
				<p>
					<b>{ $_('musicians.id') }:</b> { $Store.musician.id }<br />
					<b>{ $_('musicians.name') }:</b> { $Store.musician.name }<br /> 
					<b>{ $_('musicians.band') }:</b> { $Store.musician.band }
				</p>
			{/if}
		</div>
		
  </section>
</div>
