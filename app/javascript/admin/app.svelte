<script>
  import { Router } from 'svelte-router-spa'
  import { routes } from './routes'

  const prefix = window.I18n.prefix == '' ? 'admin' : `${window.I18n.prefix}admin`
  console.log(prefix);
</script>

<script context="module">
  import { Route, Navigate } from 'svelte-router-spa'

  export { Route, Navigate }
</script>


<Router { routes } options={ { prefix: prefix } } />