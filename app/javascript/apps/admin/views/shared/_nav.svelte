<script>
import {
  _
} from 'svelte-i18n'
import {
  router,
  Link
} from '@gbarillot/svelte-router'

let currentLocale = I18n.locale;
const setLocale = ((e) => {
  window.location.href = e.target.value === I18n.availableLocales[0] ?
    `/admin${$router.fullPath}` :
    `/${e.target.value}/admin${$router.fullPath}`
})
</script>

<section class="top-nav">
    <div class="container">
        <div class="row">
            <div class="col-xs-8 col-sm-9">
                <nav>
                    <ul>
                        <li class="{['root'].includes($router.name) ? 'active' : ''}">
                            <Link to="root">{ $_('nav.home') }</Link>
                        </li>
                        <li class="{['movies', 'edit_movie', 'new_movie'].includes($router.name) ? 'active' : ''}">
                            <Link to="movies">{ $_('nav.movies') }</Link>
                        </li>
                        <li class="{['websockets'].includes($router.name) ? 'active' : ''}">
                            <Link to="websockets">{ $_('nav.websockets') }</Link>
                        </li>
                        <li>
                            <a href="{window.I18n.prefix + '/users/sign_out'}">{ $_('nav.logout') }</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-xs-4 col-sm-3 hidden-xs">
                <select bind:value={currentLocale} on:change={setLocale} id="localeSwitcher">
                    {#each window.I18n.availableLocales as name}
                    <option value={name}>{ name.toUpperCase() }</option>
                    {/each}
                </select>
            </div>
        </div>
    </div>
</section>
