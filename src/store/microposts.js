import { defineStore } from 'pinia'
import { useUserStore } from './user'

export const useMicropostsStore = defineStore({
    id: 'microposts',
    state: () => ({
        microposts: [
        // {
        //"id":"1",
        //"content":"bla bla bla",
        //"user_id":"45",        
        //"author":"John Smith", 
        //"created_at":"2016-10-18 12:14:51",   
        //"updated_at":"2016-10-18 12:14:51", 
        //"likes":"23",                             
        //}
        ]
    }),
    getters: {
        getMicroposts (state) {
            return state.microposts;
        },
        getMicropost: (state) => (id) => {
            let index = state.microposts.findIndex(mp => mp.id == id)
            return state.microposts[index]
        },  
    }, 
    actions: {
        addMicroposts(microposts){
            this.microposts = microposts
        },
        addMicropost(micropost){
            this.microposts = [...this.microposts, micropost]
        },
        updateMicropost(data){
            this.microposts = this.microposts.map(micropost => (micropost.id === data.id ? data : micropost))
        },
        deleteMicropost(idToRemove){
            this.microposts.forEach( function () {       
                this.microposts = this.microposts.filter(function(micropost) {
                  return micropost.id !== idToRemove
                })
            })
        },
        deleteMicroposts(){
            this.microposts = []
        },     
        async getMicropostsDB() {
			try {
				const response = await fetch(`http://daw.deei.fct.ualg.pt/~a12345/LAB8_10/api/microposts.php`)
				const data = await response.json()
                this.addMicroposts(data)
                return true
			} 
			catch (error) {
				console.error(error)
                return false
			}
		},
        async addMicropostDB(newMicropost) {
			try {
                const userStore = useUserStore()
				const response = await fetch(`http://daw.deei.fct.ualg.pt/~a12345/LAB8_10/api/microposts.php?session_id=${userStore.user.session_id}`, {
					method: 'POST',
					body: JSON.stringify(newMicropost.post),
					headers: { 'Content-type': 'application/json; charset=UTF-8' },
				})
				const data = await response.json()
                console.log(data)
                this.addMicropost(data)
                return true
			} 
			catch (error) {
				console.error(error)
                return false
			}
		},
        async updateMicropostDB(micropost) {
			try {
                const userStore = useUserStore()                
				const response = await fetch(`http://daw.deei.fct.ualg.pt/~a12345/LAB8_10/api/microposts.php?micropost_id=${micropost.post_id}&session_id=${userStore.user.session_id}`, {
					method: 'PUT',
					body: JSON.stringify(micropost.post),
                    headers: { 'Content-type': 'application/json; charset=UTF-8' },
				})
				const data = await response.json()
                console.log(data)
                this.updateMicropost(data)
                return true
			} 
			catch (error) {
				console.error(error)
                return false

			}
		},
		async deleteMicropostDB(micropost) {
			try {
                await fetch(`http://daw.deei.fct.ualg.pt/~a12345/LAB8_10/api/microposts.php?micropost_id=${micropost.id}&session_id=${userStore.user.session_id}`, {
                    method: 'DELETE',                
                })
                this.deleteMicropost(micropost.id)
                return true
			} 
			catch (error) {
				console.error(error)
                return false
			}
		},

    },
})

