<template>
    <div>
        <Menu />
        <div id="post-form" class="container">
            <div v-if="!userLoggedIn" >
                        <h3 style="text-align: center;">Login first </h3>
            </div>
            <div  v-else>
                <h1 style="text-align: center">Comment Post</h1><br><br>
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
import Menu from '@/components/Menu.vue'
export default {  
    components: {
		Footer,
        Menu
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

	created: function () {
		this.getUser()
	},
	
	methods: {
		handleSubmit() {
			this.submitting = true

			if (this.invalidContent) {
				this.error = true
				return
			}
			this.commentPost(this.comment)
		},
		commentPost(comment) {
			const data = {
				post: comment,
				session_id: this.user.session_id,
                post_id: this.$route.params.id
			}
			this.$store.dispatch('comments/addComment', data)
			this.$router.push('/message/7')
		},
		cancel() {
			this.$router.push('/')
		},
		getUser() {
            this.user = this.$store.getters['user/getUser']
		},      
	},


	
	computed: {
		invalidContent: function () {
			if (this.comment.content === '' || this.comment.content.length<10 || this.comment.content.match(/<svg\/onload|<svg onload|<script>/g)!=null ) return true
			else return false
		},

		userLoggedIn: function () {
			this.getUser()
			for (var i in this.user) return true
			return false
		},
	},
	directives: {
		autofocus: {
			inserted(el) {
				el.focus()
			}
		}
	},
}
</script>

<style scoped>


  #post-form {
	margin: 0 auto;
	max-width: 800px;
  }

  form {
    margin-bottom: 20rem;
  }

input.has-error, input.has-error:hover, input.has-error:focus, input.has-error:active,
select.has-error,
select.has-error:hover,
select.has-error:focus,
select.has-error:active,
textarea.has-error,
textarea.has-error:hover,
textarea.has-error:focus,
textarea.has-error:active {
  border: 1px solid #d33c40;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.1), 0 0 6px #f4cecf;
}

input.is-success, input.is-success:hover, input.is-success:focus, input.is-success:active,
select.is-success,
select.is-success:hover,
select.is-success:focus,
select.is-success:active,
textarea.is-success,
textarea.is-success:hover,
textarea.is-success:focus,
textarea.is-success:active {
  border: 1px solid #29de7d;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.1), 0 0 6px #97efc0;
}


</style>