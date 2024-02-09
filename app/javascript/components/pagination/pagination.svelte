<script>
import {
  _
} from 'svelte-i18n'
import {
  router
} from '@gbarillot/svelte-router'

export let pagination;
export let callback;

export let firstPages = [];
export let centerPages = [];
export let lastPages = [];

function go(e) {
  const url = new URL(e.target.href);
  const params = new URLSearchParams(url.search).toString();
  router.push($router.path, { query: params })
  callback();
}

function setPerPage(perPage) {
  let params = new URLSearchParams({
    ...$router.query,
    per: perPage.target.value,
    page: 1
  }).toString();
  router.push($router.path, { query: params })
  callback();
}

$: pageLink = function(n) {
  let newQuery = new URLSearchParams({
    ...$router.query,
    page: n
  }).toString();
  return `${$router.path}?${newQuery}`
}

$: {
  firstPages = [];  
  for (let i = 1; i <= 5; i++) {
    if(i <= pagination.pages) { firstPages.push(i) }
  }   
  lastPages = []
  if(pagination.pages > 5) {
    for (let i = pagination.pages - 5; i <= pagination.pages; i++) {
      lastPages.push(i) 
    } 
  }
}

$: {
  centerPages = [];
  if(pagination.pages > 10) {
    let center = (pagination.current < 4 || pagination.current > pagination.pages - 4) ? Math.floor(pagination.pages / 2) : pagination.current 
    for (let i = center - 2; i <= center + 2; i++) {
      centerPages.push(i);
    } 
    centerPages = centerPages.filter(item => !firstPages.includes(item) && !lastPages.includes(item));
  }
}
</script>

<section class="container-fluid pagination">
    <select on:change={setPerPage}>
      {#each [5, 10, 25, 50] as perPage}
        <option value={perPage} selected={pagination.per_page == perPage}>{ perPage }</option>
      {/each}
    </select>

    {#if pagination.next || pagination.previous}
    <ul>
        {#if pagination.previous != null}
        <li><a on:click|preventDefault={go} href={pageLink(pagination.current - 1)}>&laquo;</a></li>
        {/if}

        {#each firstPages as page}
        <li><a on:click|preventDefault={go} href={pageLink(page)}  class={pagination.current == page ? 'active' : ''}>{ page }</a></li>
        {/each}

        {#if centerPages[0] > firstPages[firstPages.length - 1] + 1}
        <li>...</li>
        {/if}
        {#each centerPages as page}
        <li><a on:click|preventDefault={go} href={pageLink(page)}  class={pagination.current == page ? 'active' : ''}>{ page }</a></li>
        {/each}
        {#if centerPages[centerPages.length - 1] < lastPages[0] - 1}
        <li>...</li>
        {/if}

        {#each lastPages as page}
        <li><a on:click|preventDefault={go} href={pageLink(page)} class={pagination.current == page ? 'active' : ''}>{ page }</a></li>
        {/each}
        
        {#if pagination.pages > 0 && pagination.current != pagination.pages}
        <li><a on:click|preventDefault={go} href={pageLink(pagination.current + 1)}>&raquo;</a></li>
        {/if}
    </ul>
    {/if}
</section>
