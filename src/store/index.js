import { createStore } from 'vuex'
import microposts from './microposts'
import user from './user'
import comments from './comments'

export default createStore({
  modules: {
    microposts,
    user,
    comments,
  }
})
