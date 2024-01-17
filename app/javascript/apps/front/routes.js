import Homepage from './views/movies/index.svelte'
import MovieShow from './views/movies/show.svelte'
import PageIndex from './views/pages/index.svelte'

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