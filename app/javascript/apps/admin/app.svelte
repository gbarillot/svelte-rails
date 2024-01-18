<script>
import {
  createRouter,
  View,
  onRouteChange
} from '@gbarillot/svelte-router'

import {
  routes
} from './routes'
import Nav from './views/shared/_nav.svelte'
import Footer from './views/shared/_footer.svelte'

const router = createRouter({
  base: `${window.I18n.prefix}/admin`,
  routes: routes
})

onRouteChange((before, after) => {
  if (!after) {
    window.location.href = '/404'
  }
});
</script>

<main>
    <Nav />
    <View></View>
</main>
<Footer />
