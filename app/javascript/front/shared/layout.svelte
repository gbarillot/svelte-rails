<script>
  import { Route } from 'svelte-router-spa'
  import  Nav  from './_nav.svelte'
  import  Footer  from './_footer.svelte'
  
  export let currentRoute;
  export let params; 
</script>

<main>
  <Nav {currentRoute}  {params} /> 
  <Route {currentRoute}  {params} />
</main>  
<Footer />

