<script>
	import { Link } from '@gbarillot/svelte-router'
	import { Store, Api } from '@/front/stores/musicians'	

	onMount(async () => {
		$Api.index();
	});
</script>

<div class="container">
  <section class="container">
    <h1>{ $_('home.title') }</h1>

    <ul class="breadcrumb">
      <li><span>{ $_('home.breadcrumb') }</span></li>
    </ul>

    <div class="row">
			{#each $Store.musicians as {id, name}}
				<div class="col-xs-12 col-md-3 card">
					<p><Link to="musician" params={{id: id}}>{ name }</Link></p>
				</div>
			{/each}
    </div>
  </section>
</div>
