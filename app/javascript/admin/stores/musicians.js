import { Xhr } from '@/support/xhr.js'

const Store = writable({
  progress: '',
  errors: {},
  bands: [],
  musician: {},
  musicians: [],
  pagination: {}
});

const Api = readable({
  index: async (fullPath) => {  
    await Xhr.get(fullPath).then((response) => {
      Store.update(current => ({ ...current, 
        musicians: response.data.musicians,
        bands: response.data.bands,
        pagination: response.data.pagination
      }))
    })
  },
  new: async () => {
    Store.update(current => ({ ...current, progress: ''}))
    Store.update(current => ({ ...current, errors: {}}))

    await Xhr.get(`/musicians/new`).then(response => {             
      Store.update(current => ({ ...current, 
        musician: response.data.musician,
        bands: response.data.bands
      }))
    })  
  },
  create: async () => {
    Store.update(current => ({ ...current, progress: 'loading'}))
    Store.update(current => ({ ...current, errors: {}}))

    await Xhr.post(`/musicians`, get(Store).musician).then(response => {        
      Store.update(current => ({ ...current, errors: {}}))
    }).catch(error => {
      Store.update(current => ({ ...current, errors: error.response.data.errors}))
    }).finally(() => {
      Store.update(current => ({ ...current, progress: ''}))
    })
  },
  edit: async (id) => {
    await Xhr.get(`/musicians/${id}/edit`).then((response) => {
      Store.update(current => ({ ...current, 
        musician: response.data.musician,
        bands: response.data.bands
      }))
    })
  },
  update: async (id) => {
    Store.update(current => ({ ...current, progress: 'loading'}))
    Store.update(current => ({ ...current, errors: {}}))

    await Xhr.put(`/musicians/${id}`, get(Store).musician).then(response => {        
      Store.update(current => ({ ...current, errors: {}}))
    }).catch(error => {
      Store.update(current => ({ ...current, errors: error.response.data.errors}))
    }).finally(() => {
      Store.update(current => ({ ...current, progress: ''}))
    })
  },
  destroy: async (id) => {      
    await Xhr.delete(`/musicians/${id}`).then(response => {  
      Store.update(current => ({ ...current, errors: {}}))    
    }).catch(error => {
      Store.update(current => ({ ...current, errors: error.response.data.errors}))
    }) 
  }
})

export { Store, Api }

