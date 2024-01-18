<script>
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

function activeOn(paths) {
  //console.log($router);
}
</script>

<section class="top-nav">
    <div class="container">
        <div class="row">
            <div class="col-xs-8 col-sm-9">
                <nav>
                    <ul>
                        <li class="{activeOn(['root'])}">
                            <Link to="root">{ $_('nav.home') }</Link>
                        </li>
                        <li class="{activeOn(['musicians', 'edit_musician', 'new_musician'])}">
                            <Link to="movies">{ $_('nav.movies') }</Link>
                        </li>
                        <li class="{activeOn(['websockets'])}">
                            <Link to="websockets">{ $_('nav.websockets') }</Link>
                        </li>
                        <li>
                            <a href="{window.I18n.prefix + '/users/sign_out'}">{ $_('nav.logout') }</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-xs-4 col-sm-3">
                <select bind:value={currentLocale} on:change={setLocale}>
                    {#each window.I18n.availableLocales as name}
                    <option value={name}>{ name.toUpperCase() }</option>
                    {/each}
                </select>
            </div>
        </div>
    </div>
</section>
