<script>
	import { Link } from '@gbarillot/svelte-router'
	import { Store, Api } from '../../stores/movies'	

	onMount(() => {
		$Api.index();
	});
</script>

<div class="container">
  <section class="container">
    <div class="row">
			{#each $Store.movies as movie}
				<div class="col-xs-12 col-md-3 card">
					<p>
						<Link to="movie" params={{id: movie.id}}><img src={ movie.poster_url } alt={movie.name} /></Link>
					</p>
				</div>
			{/each}
    </div>
  </section>
</div>
