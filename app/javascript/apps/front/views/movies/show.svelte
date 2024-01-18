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
            <div class="row">
                <div class="col-xs-12 col-md-4">
                    <img src={ $Store.movie.poster_url } alt={ $Store.movie.name } />
                </div>
                <div class="col-xs-12 col-md-8">
                    <p>
                        <b>{ $Store.movie.name }</b>
                        <br />
                        { $Store.movie.genre }
                    </p>
                    <p>{ $Store.movie.description}</p>
                </div>
            </div>
        </div>
    </section>
</div>
