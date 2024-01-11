import PublicLayout from './shared/layout.svelte'
import Homepage from './musicians/index.svelte'
import MusicianShow from './musicians/show.svelte'
import PageIndex from './pages/index.svelte'

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
  }
]

export { routes }