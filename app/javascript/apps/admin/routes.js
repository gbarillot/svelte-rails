import MovieIndex from './movies/index.svelte'
import MovieNew from './movies/new.svelte'
import MovieEdit from './movies/edit.svelte'
import ToolingIndex from './tooling/index.svelte'
import WebsocketIndex from './websockets/index.svelte'

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