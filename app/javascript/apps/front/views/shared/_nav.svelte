<script>
  import { router, Link } from '@gbarillot/svelte-router'

  let selected = I18n.locale;
  const setLocale = ((e) => {
    window.location.href = e.target.value === I18n.availableLocales[0] 
                         ? $router.path 
                         : `/${e.target.value}${$router.path}`
  })
	const goAdmin = (() => {
		window.location.href = '/admin/'
	})
</script>

<section class="top-nav">
  <div class="container">
    <div class="row">
      <div class="col-xs-8 col-sm-9">
        <nav>
          <ul>
            <li class="{['root'].includes($router.name) ? 'active' : ''}">
              <Link to="root">{ $_('nav.homepage') }</Link>
            </li>
            <li class="{['routing'].includes($router.name) ? 'active' : ''}">
              <Link to="routing">{ $_('nav.routing') }</Link>
            </li>
            <li><a on:click|preventDefault={goAdmin} href="{window.I18n.prefix + '/admin/'}">{ $_('nav.admin') }</a></li>
          </ul>
        </nav>
      </div>
      <div class="col-xs-4 col-sm-3">
        <select bind:value={selected} on:change={setLocale}>
          {#each window.I18n.availableLocales as name}
            <option value={name}>{ name.toUpperCase() }</option>
          {/each}
        </select>
      </div>
    </div>
  </div>
</section>

<script context="module">
  export const Navbar = {}; 
</script>
