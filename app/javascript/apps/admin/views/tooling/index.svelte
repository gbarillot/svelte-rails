<script>
import {
  _
} from 'svelte-i18n'
import {
  Store,
  Api
} from '../../stores/tooling'

onMount(() => {
  $Api.index();
})
</script>

<section class="container tooling">
    <div class="row">
        <div class="col-xs-12 col-md-3 card">
            <h3>Rails 7</h3>
            <p><a href="https://edgeguides.rubyonrails.org/" target="_blank">An awesome server side Framework</a></p>
        </div>
        <div class="col-xs-12 col-md-3 card">
            <h3>Svelte</h3>
            <p><a href="https://svelte.dev/" target="_blank">SPA without the pain</a></p>
        </div>
        <div class="col-xs-12 col-md-3 card">
            <h3>Stores</h3>
            <p><a href="https://svelte.dev/docs/svelte-store" target="_blank">State management, uncluttered</a></p>
        </div>
        <div class="col-xs-12 col-md-3 card">
            <h3>SPA router</h3>
            <p><a href="https://github.com/gbarillot/svelte-router" target="_blank">Inspired by Vue router</a></p>
        </div>
        <div class="col-xs-12 col-md-3 card">
            <h3>Axios</h3>
            <p><a href="https://axios-http.com/docs/intro" target="_blank">Handles AJAX requests</a></p>
        </div>
        <div class="col-xs-12 col-md-3 card">
            <h3>Vite</h3>
            <p><a href="https://vitejs.dev/" target="_blank">Next generation Frontend tooling</a></p>
        </div>
        <div class="col-xs-12 col-md-3 card">
            <h3>Devise</h3>
            <p><a href="https://github.com/heartcombo/devise" target="_blank">Simple authentication using regular cookies that just works</a></p>
        </div>
        <div class="col-xs-12 col-md-3 card">
            <h3>I18n</h3>
            <p><a href="https://github.com/kaisermann/svelte-i18n" target="_blank">
                { $_('homepage.movies', {values: { n: 0 }}) },
                { $_('homepage.movies', {values: { n: 1 }}) },
                { $_('homepage.movies', {values: { n: $Store.metrics.movies }}) }</a>
            </p>
        </div>
        <div class="col-xs-12 col-md-3 card">
            <h3>ActionCable</h3>
            <p><a href="https://guides.rubyonrails.org/action_cable_overview.html" target="_blank">Websockets with 2 way bindings</a></p>
        </div>
        <div class="col-xs-12 col-md-3 card">
            <h3>Kaminari</h3>
            <p><a href="https://github.com/kaminari/kaminari" target="_blank">Efficient Pagination</a></p>
        </div>
        <div class="col-xs-12 col-md-3 card">
            <h3>Ransack</h3>
            <p><a href="https://github.com/activerecord-hackery/ransack" target="_blank">ActiveRecord wizardry for dynamic search filters</a></p>
        </div>
        <div class="col-xs-12 col-md-3 card">
            <h3>Bootstrap grid</h3>
            <p><a href="https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout" target="_blank">... but using native CSS Grid layout</a></p>
        </div>
    </div>
</section>
