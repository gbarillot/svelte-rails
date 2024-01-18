<script>
import {
  _
} from 'svelte-i18n'
import {
  router
} from '@gbarillot/svelte-router'

export let pagination;
export let callback;
export let pageNext = ''
export let pagePrev = ''

function go(e) {
  const url = new URL(e.target.href);
  const params = new URLSearchParams(url.search).toString();
  router.push($router.path, {
    query: params
  })
  callback();
}

$: {
  (() => {
    let query = $router.query
    let nextValue = query['page'] ? pagination.current + 1 : query['page'] = 2
    let prevValue = pagination.current - 1

    let nextQuery = new URLSearchParams({
      ...query,
      page: nextValue
    }).toString();
    pageNext = `${$router.path}?${nextQuery}`

    let prevQuery = new URLSearchParams({
      ...query,
      page: prevValue
    }).toString();
    pagePrev = `${$router.path}?${prevQuery}`
  })();
}
</script>

<section clas="container">
    {#if pagination.next || pagination.previous}
    <ul class="pagination">
        {#if pagination.previous != null}
        <li>
            <a on:click|preventDefault={go} href={pagePrev}>&laquo;</a>
        </li>
        {/if}

        {#if pagination.pages > 0 && pagination.current != pagination.pages}
        <li>
            <a on:click|preventDefault={go} href={pageNext}>&raquo;</a>
        </li>
        {/if}
    </ul>
    {/if}
</section>
