import { Xhr } from '@/support/xhr.js'

const Store = writable({
  progress: '',
  errors: {},
  genres: [],
  movie: {},
  movies: [],
  pagination: {}
});

const Api = readable({
  index: async (fullPath) => {  
    await Xhr.get(fullPath).then((response) => {
      Store.update(current => ({ ...current, 
        movies: response.data.movies,
        genre: response.data.genres,
        pagination: response.data.pagination
      }))
    })
  },
  new: async () => {
    Store.update(current => ({ ...current, progress: ''}))
    Store.update(current => ({ ...current, errors: {}}))

    await Xhr.get(`/movies/new`).then(response => {             
      Store.update(current => ({ ...current, 
        movie: response.data.movie,
        genres: response.data.genres
      }))
    })  
  },
  create: async () => {
    Store.update(current => ({ ...current, progress: 'loading'}))
    Store.update(current => ({ ...current, errors: {}}))

    await Xhr.post(`/movies`, get(Store).movie).then(response => {        
      Store.update(current => ({ ...current, errors: {}}))
    }).catch(error => {
      Store.update(current => ({ ...current, errors: error.response.data.errors}))
    }).finally(() => {
      Store.update(current => ({ ...current, progress: ''}))
    })
  },
  edit: async (id) => {
    await Xhr.get(`/movies/${id}/edit`).then((response) => {
      Store.update(current => ({ ...current, 
        movie: response.data.movie,
        genres: response.data.genres
      }))
    })
  },
  update: async (id) => {
    Store.update(current => ({ ...current, progress: 'loading'}))
    Store.update(current => ({ ...current, errors: {}}))

    await Xhr.put(`/movies/${id}`, get(Store).movie).then(response => {        
      Store.update(current => ({ ...current, errors: {}}))
    }).catch(error => {
      Store.update(current => ({ ...current, errors: error.response.data.errors}))
    }).finally(() => {
      Store.update(current => ({ ...current, progress: ''}))
    })
  },
  destroy: async (id) => {      
    await Xhr.delete(`/movies/${id}`).then(response => {  
      Store.update(current => ({ ...current, errors: {}}))    
    }).catch(error => {
      Store.update(current => ({ ...current, errors: error.response.data.errors}))
    }) 
  }
})

export { Store, Api }

