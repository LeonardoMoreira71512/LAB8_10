import { defineStore } from 'pinia'

export const useCommentsStore = defineStore({
    id: 'comments',
    state: () => ({
        comments: [
        // {
        //"id":"1",
        //"content":"bla bla bla",
        //"user_id":"45",
        //"user_name":"John Doe",        
        //"micropost_id":"105", 
        //"created_at":"2016-10-18 12:14:51",                              
        //}
        ]
    }),
    getters: {
        getComments (state) {
            return state.comments;
        },
        getPostComments: (state) => (id) => {
            const results = state.comments.filter(c => {
                return c.micropost_id == id;
              })
              return results
        },
    }, 
    actions: {

        addComments(comments) {
            this.comments = comments
        },
        addComment(comment) {
            this.comments = [...this.comments, comment]
        },

        async getCommentsInDB() {
			try {
				const response = await fetch(`http://localhost/LAB8_10/api/comments.php`)
				const data = await response.json()
                this.addComments(data)
			} 
			catch (error) {
				console.error(error)
			}
		},
        async addCommentInDB(newComment) {
			try {
				const response = await fetch(`http://localhost/LAB8_10/api/comments.php?micropost_id=${newComment.post_id}&session_id=${newComment.session_id}`, {
					method: 'POST',
					body: JSON.stringify(newComment.post),
					headers: { 'Content-type': 'application/json; charset=UTF-8' },
				})
				const data = await response.json()
                console.log(data)
                this.addComment(data)
			} 
			catch (error) {
				console.error(error)
			}
		},

    }
})