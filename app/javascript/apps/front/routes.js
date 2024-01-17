import Homepage from './movies/index.svelte'
import MovieShow from './movies/show.svelte'
import PageIndex from './pages/index.svelte'

const routes = [
  {
    path: '/',
    name: 'root',
    component: Homepage
  },
  {
    path: '/movies/:id',
    name: 'movie',
    component: MovieShow
  },
  {
    path: '/pages',
    name: 'pages',
    component: PageIndex
  }
]

export { routes }