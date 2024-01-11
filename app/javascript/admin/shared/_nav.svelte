<script>
  import Lnk from '@/support/lnk.svelte'
  
  export let currentRoute; currentRoute;
  export let params; params;

  let selected = I18n.locale;
  const setLocale = ((e) => {
    window.location.href = e.target.value === I18n.availableLocales[0] 
                         ? `/admin${currentRoute.name}` 
                         : `/${e.target.value}/admin${currentRoute.name}`
  })
</script>

<section class="top-nav">
  <div class="container">
    <div class="row">
      <div class="col-xs-8 col-sm-9">
        <nav>
          <ul>
            <li><Lnk to="root">{ $_('nav.homepage') }</Lnk></li>
            <li><Lnk to="pages">{ $_('nav.pages') }</Lnk></li> -->
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
