<template>
    <div>
        <Header />
        <div id="post-form" class="container">
            <div v-if="userIsEmpty" >
                <div class="container mt-3">
				<div class="row align-items-center">
					<div class="col">
					</div>
					<div class="col-8">
						<div class="card bg-success text-center">
							<div class="card-body">
								<h1 class="display-3">Login first</h1>
							</div>
						</div>
					</div>
					<div class="col">
					</div>
				</div>
			</div>
            </div>
            <div v-else>
				<div class="comment-title-container">
                    <h1 class="comment-title">Comment Post</h1>
                </div>
				<div v-if="error" class="alert alert-danger text-center" role="alert">
					{{error}}
				</div>
                <form @submit.prevent="handleSubmit">
                    <div class="form-group">
                        <textarea
                            class="form-control" 
                            rows="5"
                            ref="first"
                            placeholder="Please enter at least 10 characters"
                            :class="{ 'has-error': submitting && invalidContent }"
                            v-model="comment.content"
                            v-autofocus
                        > 
                        </textarea>
                    </div>


                    <p v-if="error && submitting" class="alert alert-warning">
                        fill out all required fields with valid data
                    </p>
                    
                    <p style="float:left;"><button @click="cancel()" class="btn btn-warning">Cancel</button></p>
                    <p style="float:right;"><button type="submit" class="btn btn-primary">Comment Post</button></p>

                </form>
            </div>
        </div>
        <Footer />
    </div>

</template>

<script>
import Footer from '@/components/Footer.vue'
import Header from '@/components/Header.vue'

import { useMicropostsStore } from '@/store/microposts'
import { useCommentsStore } from '@/store/comments'
import { useUserStore } from '@/store/user'

export default {  

	setup() {
		const userStore = useUserStore()
		const commentsStore = useCommentsStore()
		const micropostsStore = useMicropostsStore()
		return { userStore, commentsStore, micropostsStore }
  	},

    components: {
		Footer,
        Header
	},	
	data() {
      return {
		submitting: false,
		error: false,
        comment: {
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
		this.getPost()
	},
	
	methods: {
		getPost(){
			this.post = this.micropostsStore.getMicropost(this.$route.params.id)
		},

		getUser() {
            this.user = this.userStore.getUser
		}, 

        handleSubmit() {
			this.submitting = true

			if (this.invalidContent) {
				this.error = "por favor escreva algo que vai na sua cabeça para submeter"
				return
			}

			const newComment = {
                post_id: this.post.id,
				content: this.comment.content,
				session_id: this.user.session_id
			}

			this.commentPost(newComment)
		},

		async commentPost(newComment) {
			await this.commentsStore.addCommentInDB(newComment)
			this.$router.push('/message/7')
		},
        cancel() {
			this.$router.push('/')
		},
		
     
	},
	
	computed: {
        invalidContent: function () {
			if (this.comment.content === '') return true
			else return false
		},

        userIsEmpty: function () {
			let obj = this.userStore.getUser
			return Object.keys(obj).length === 0;
		}
	},
	directives: {
	},
}
</script>

<style scoped>
.comment-title-container {
    background-color: rgba(126, 63, 164, 0.97); /* Cor de fundo do retângulo */
    padding: 15px;
    border-radius: 8px; /* Borda arredondada */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Sombra suave */
    margin-bottom: 20px;
    text-align: center;
}

.comment-title {
    margin: 0;
    color: #1012109a; /* Cor do texto */
    font-weight: bold;
    font-size: 2em;
}

  
</style>