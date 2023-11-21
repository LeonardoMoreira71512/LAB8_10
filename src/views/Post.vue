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
		return { userStore, micropostsStore }
	},

	components: {
		Footer,
		Header
	},
	data() {
		return {
			submitting: false,
			error: null,
			post: {
				content: '',
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
	},

	methods: {
		handleSubmit() {
			this.submitting = true

			if (this.invalidContent) {
				this.error = 'Content must not be empty';
				return
			}
			// Create a newMicropost object
			const newMicropost = {
				content: this.post.content,
				session_id: this.user.session_id
			}

			this.addPost(newMicropost)
		},
		async addPost(newMicropost) {
			await this.micropostsStore.addMicropostInDB(newMicropost)
			this.$router.push('/message/3')
		},
		cancel() {
			this.$router.push('/')
		},
		getUser() {
			this.user = this.userStore.getUser
		},
	},

	computed: {
		invalidContent: function () {
			if (this.post.content === '') return true
			else return false
		},
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
.form {
    background-color: #f8f9fa;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
}
.form-group textarea {
    resize: none;
}
.btn-primary {
    background-color: #4CAF50;
    border-color: #4CAF50;
}
.btn-secondary {
    background-color: #f44336;
    border-color: #f44336;
}
</style>