<script>
	import Lnk from '@/support/lnk.svelte'
	import { Store } from '@/front/stores/musicians'	

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
					<p><Lnk to='musician' params={{id: id}} attrs={{class: "active"}} data={{drag: true, is: 'draggable'}}>{ name }</Lnk></p>
				</div>
			{/each}
    </div>
  </section>
</div>
