import Homepage from './musicians/index.svelte'
import MusicianShow from './musicians/show.svelte'
import PageIndex from './pages/index.svelte'

const routes = [
  {
    path: '/',
    name: 'root',
    component: Homepage
  },
  {
    path: '/musicians/:id',
    name: 'musician',
    component: MusicianShow
  },
  {
    path: '/pages',
    name: 'pages',
    component: PageIndex
  }
]

export { routes }