<template>
    <div>
        <Header />

		<form @submit.prevent="handleSubmit" class="form">
			<div class="form-group m-5">
				<textarea class="form-control" rows="5" id="comment" v-model="post.content"
					placeholder="Write your post here..."></textarea>
			</div>
			<div class="form-group text-center">
				<button type="submit" class="btn btn-primary btn-lg" style="margin-right: 1rem;">Add Post</button>
				<button @click="cancel()" type="reset" class="btn btn-secondary btn-lg">Clear</button>
			</div>
		</form>

        <Footer />
    </div>

</template>

<script>
import Footer from '@/components/Footer.vue'
import Header from '@/components/Header.vue'

import { useUserStore } from '@/store/user'
import { useMicropostsStore } from '@/store/microposts'

export default { 

	setup() {
		const userStore = useUserStore()
		const micropostsStore = useMicropostsStore()
		return { userStore, micropostsStore}
  	},

    components: {
		Footer,
        Header
	},	
	data() {
		return {
		submitting: false,
		error: false,
        post: {
            content:'',                           
        },
		user: {
			id: '', 
			name: '', 
			email: '', 
			session_id: ''
		},
      }
    },

	mounted() {
		this.getUser()
		this.getPost()
	},
	
	methods: {
		getUser() {
			this.user = this.userStore.getUser
		},
		getPost(){
			this.post = this.micropostsStore.getMicropost(this.$route.params.id)
		},
		handleSubmit() {
			this.submitting = true

			if (this.invalidContent) {
				this.error = 'Content must not be empty';
				return
			}
			// Create a updateMicropost object
			const updateMicropost = {
				post_id: this.post.id,
				content: this.post.content,
				session_id: this.user.session_id
			}

			this.updatePost(updateMicropost)
		},
		async updatePost(updateMicropost) {
			await this.micropostsStore.updateMicropostDB(updateMicropost)
			this.$router.push('/message/1')
		},
		cancel() {
			this.$router.push('/')
		},
	},
	
	computed: {
		userLoggedIn: function () {
			this.getUser()
			for (var i in this.user) return true
			return false
		},
	},
	directives: {

	},
}
</script>

<style scoped>



</style>