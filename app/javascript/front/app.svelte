<script>
  import { Router } from 'svelte-router-spa'
  import { routes } from './routes'
</script>

<script context="module">
  import { Route, Navigate } from 'svelte-router-spa'

  export { Route, Navigate }
</script>

<Router { routes } options={ { prefix: window.I18n.prefix } } />