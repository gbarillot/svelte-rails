import PublicLayout from './shared/layout.svelte'
import Homepage from './musicians/index.svelte'
import MusicianShow from './musicians/show.svelte'
import PageIndex from './pages/index.svelte'
import Error404 from '@/support/404.svelte'
import Error500 from '@/support/500.svelte'

const routes = [
  {
    name: '/',
    label: 'root',
    layout: PublicLayout,
    component: Homepage
  },
  {
    name: '/musicians/:id',
    label: 'musician',
    layout: PublicLayout,
    component: MusicianShow
  },
  {
    name: '/pages',
    label: 'pages',
    layout: PublicLayout,
    component: PageIndex
  },
  {
    name: '/admin',
    label: 'admin',
    redirectTo: '/admin'
  },
  {
    name: '404',
    component: Error404
  }
]

export { routes }