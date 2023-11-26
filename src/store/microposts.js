import { defineStore } from 'pinia'

export const useMicropostsStore = defineStore({
    id: 'microposts',
    state: () => ({
        microposts: [
        // {
        //"id":"1",
        //"content":"bla bla bla",
        //"user_id":"45",        
        //"name":"John Smith", 
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
        async getMicropostsInDB() {
			try {
				const response = await fetch(`http://daw.deei.fct.ualg.pt/~a71512/LAB8_10/api/microposts.php`)
				const data = await response.json()
                this.addMicroposts(data)
                return true
			} 
			catch (error) {
				console.error(error)
			}
		},
        async addMicropostInDB(newMicropost) {
			try {
				const response = await fetch(`http://daw.deei.fct.ualg.pt/~a71512/LAB8_10/api/microposts.php?session_id=${newMicropost.session_id}`, {
					method: 'POST',
					body: JSON.stringify(newMicropost),
					headers: { 'Content-type': 'application/json; charset=UTF-8' },
				})
				const data = await response.json()
                console.log(data)
                this.addMicropost(data)
                return true
			} 
			catch (error) {
				console.error(error)
			}
		},
        async updateMicropostDB(updateMicropost) {
			try {
				const response = await fetch(`http://daw.deei.fct.ualg.pt/~a71512/LAB8_10/api/microposts.php?micropost_id=${updateMicropost.post_id}&session_id=${updateMicropost.session_id}`, {
					method: 'PUT',
					body: JSON.stringify(updateMicropost),
                    headers: { 'Content-type': 'application/json; charset=UTF-8' },
				})
				const data = await response.json()
                console.log(data)
                this.updateMicropost(data)
			} 
				catch (error) {
					console.error(error)
                    return false;
			}
		},
		async deleteMicropostInDB(micropost) {
			try {
			await fetch(`http://daw.deei.fct.ualg.pt/~a71512/LAB8_10/api/microposts.php?micropost_id=${micropost.id}&session_id=${micropost.session_id}`, {
                method: 'DELETE',                
            })
            this.deleteMicropost(micropost.id)
			} 
			catch (error) {
				console.error(error);
			}
		},

    },
})