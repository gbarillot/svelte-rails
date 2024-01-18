<script>
import {
  _
} from 'svelte-i18n'
import {
  Api
} from '../../stores/movies'

const notFound = (() => {
  $Api.show('404');
})
const unauthorized = (() => {
  $Api.show('this-will-trigger-a-401');
})
const crash = (() => {
  $Api.show('this-will-trigger-a-500');
})
</script>

<section class="container">
    <div class="page">
        <h1>{ $_('pages.title') }</h1>

        <p><a on:click|preventDefault={notFound} href="#">{ $_('pages.server_404') }</a></p>
        <p><a href="/dead-link">{ $_('pages.client_404') }</a></p>
        <p><a on:click|preventDefault={unauthorized} href={'#'}>{ $_('pages.server_401') }</a></p>
        <p><a on:click|preventDefault={crash} href="#">{ $_('pages.server_500') }</a></p>
    </div>
</section>
