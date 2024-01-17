<script>
	import { Link } from '@gbarillot/svelte-router'
	import { Store, Api } from '@/apps/front/stores/movies'	

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
			{#each $Store.movies as {id, name}}
				<div class="col-xs-12 col-md-3 card">
					<p><Link to="movie" params={{id: id}}>{ name }</Link></p>
				</div>
			{/each}
    </div>
  </section>
</div>
