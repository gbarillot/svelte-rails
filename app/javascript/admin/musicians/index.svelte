<script>
	import { Store } from '@/front/stores/musicians'	
	export let currentRoute; 

	onMount(async () => {
		$Store.index();
	});
</script>

<div class="container">
  <section class="container">
    <h1>{ $_('home.title') } ADMIN</h1>

    <ul class="breadcrumb">
      <li><span>{ $_('home.breadcrumb') }</span></li>
    </ul>

    <div class="row">
			{#each $Store.musicians as {id, name}}
				<div class="col-xs-12 col-md-3 card">
					<p><a href={ `/musicians/${id}` }>{ name }</a></p>
				</div>
			{/each}
    </div>
  </section>
</div>
