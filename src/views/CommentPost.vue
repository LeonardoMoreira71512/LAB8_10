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

import { useCommentsStore } from '@/store/comments'
import { useUserStore } from '@/store/user'

export default {  

	setup() {
		const userStore = useUserStore()
		const commentsStore = useCommentsStore()
		return { userStore, commentsStore }
  	},

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

	mounted() {

	},
	
	methods: {
     
	},


	
	computed: {

	},
	directives: {

	},
}
</script>

<style scoped>


  
</style>