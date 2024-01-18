<script>
import {
  _
} from 'svelte-i18n'
import {
  router,
  Link
} from '@gbarillot/svelte-router'
import {
  Store,
  Api
} from '@/apps/front/stores/movies'

onMount(() => {
  $Api.show($router.params.id);
});
</script>

<div class="container">
    <section class="container">
        <ul class="breadcrumb">
            <li><Link to="root">{ $_('home.breadcrumb') }</Link></li>
            <li>{ $Store.movie.name }</li>
        </ul>

        <div class="page">
            <h2>{ $_('movies.title') }</h2>
            {#if $Store.movie.id != null}
            <p>
                <b>{ $_('movies.id') }:</b> { $Store.movie.id }<br />
                <b>{ $_('movies.name') }:</b> { $Store.movie.name }<br />
                <b>{ $_('movies.band') }:</b> { $Store.movie.band }
            </p>
            {/if}
        </div>

    </section>
</div>
