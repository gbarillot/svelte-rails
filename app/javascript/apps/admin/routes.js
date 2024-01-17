import MovieIndex from './views/movies/index.svelte'
import MovieNew from './views/movies/new.svelte'
import MovieEdit from './views/movies/edit.svelte'
import ToolingIndex from './views/tooling/index.svelte'
import WebsocketIndex from './views/websockets/index.svelte'

const routes = [
  {
    path: '/',
    name: 'root',
    component: ToolingIndex
  },
  {
    path: '/movies',
    name: 'movies',
    component: MovieIndex
  },
  {
    path: '/movies/new',
    name: 'new_movie',
    component: MovieNew
  },
  {
    path: '/movies/:id/edit',
    name: 'edit_movie',
    component: MovieEdit
  },
  {
    path: '/websockets',
    name: 'websockets',
    component: WebsocketIndex
  },
]

export { routes }