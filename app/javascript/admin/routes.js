import Dashboard from './dashboard/index.svelte'
import MusicianIndex from './musicians/index.svelte'
import MusicianNew from './musicians/new.svelte'
import MusicianEdit from './musicians/edit.svelte'
import WebsocketIndex from './websockets/index.svelte'

const routes = [
  {
    path: '/',
    name: 'root',
    component: Dashboard
  },
  {
    path: '/musicians',
    name: 'musicians',
    component: MusicianIndex
  },
  {
    path: '/musicians/new',
    name: 'new_musician',
    component: MusicianNew
  },
  {
    path: '/musicians/:id',
    name: 'musician',
    component: MusicianEdit
  },
  {
    path: '/websockets',
    name: 'websockets',
    component: WebsocketIndex
  },
]

export { routes }