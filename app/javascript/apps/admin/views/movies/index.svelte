<script>
import {
  _
} from 'svelte-i18n'
import {
  router,
  Link
} from '@gbarillot/svelte-router'
import {
  Api,
  Store
} from '../../stores/movies'
import Filters from './_filters.svelte'
import Pagination from '../shared/_pagination.svelte'

function load() {
  $Api.index($router.fullPath);
}
onMount(() => {
  load();
});
</script>

<section class="container movies">
    <div class="row">
        <div class="col-xs-12 col-lg-8 col-xl-9">
            <ul class="breadcrumb">
                <li><Link to="root">{ $_('title') }</Link></li>
                <li>{ $_('nav.movies') }</li>
            </ul>
        </div>
        <div class="col-xs-12 col-lg-4 col-xl-3 ta-right">
            <Link to="new_movie" attrs={{class: "button button-primary", role: "button", style: "width: 100%"}}>{ $_('movies.create') }</Link>
        </div>
    </div>

    <Filters genres={$Store.genres} callback={load} />

    <div>
        {#if $Store.movies.length > 0}
        <table class="table movies">
            <thead>
                <tr>
                    <th style="width: 100px"></th>
                    <th>{ $_('movies.form.name') }</th>
                    <th>{ $_('movies.form.genre') }</th>
                </tr>
            </thead>
            <tbody>
                {#each $Store.movies as movie}
                <tr>
                    <td>
                        <Link to="edit_movie", params={{id: movie.id}}>
                        <img src={ movie.poster_url } alt={ movie.name }/>
                        </Link>
                    </td>
                    <td><Link to="edit_movie", params={{id: movie.id}}>{ movie.name }</Link></td>
                    <td><Link to="edit_movie", params={{id: movie.id}}>{ movie.genre }</Link></td>
                </tr>
                {/each}
            </tbody>
        </table>
        {:else}
        <h3 class="ta-center">{ $_('no_result') }</h3>
        {/if}

        <Pagination pagination={$Store.pagination} callback={load}></Pagination>
    </div>
</section>
