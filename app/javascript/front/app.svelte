<script>
  import { createRouter, View, onRouteChange } from '@gbarillot/svelte-router'

  import { routes } from './routes'
  import  Nav  from './shared/_nav.svelte'
  import  Footer  from './shared/_footer.svelte'

  const router = createRouter({ base: window.I18n.prefix, routes: routes })

  onRouteChange((before, after) => {
    
    // console.log('---------------------')
    // console.log(`${before} => ${after}`)

    if(!after) {
      window.location.href = '/404'
    }
  });
</script>

<main>
  <Nav /> 
  <View></View>
</main>  
<Footer />


