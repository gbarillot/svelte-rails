import { Xhr } from '@/support/xhr.js'

const Store = writable({
  movies: [],
  movie: {
    id: null,
    name: '',
    description: ''
  }
});

const Api = readable({
  index: async () => {  
    await Xhr.get(`/movies`).then((response) => {
      Store.update((storeData) => {
        storeData.movies = response.data.movies;
        return storeData;
      });
    })
  },
  show: async (id) => {
    await Xhr.get(`/movies/${id}`).then((response) => {
      Store.update((storeData) => {
        storeData.movie = response.data.movie;
        return storeData;
      });
    })
  }
})

export { Store, Api }

