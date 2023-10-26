<template>
	<div class="logout">
			<h1 class="success-message" style="text-align: center;">{{message}}</h1>
	
	</div>
</template>

<script>


import { useUserStore } from '@/store/user'


export default {

	setup() {
		const userStore = useUserStore()
		return { userStore }
  	},	

    data() {
        return {
            message: ''
        }
	},
	mounted() {
		this.setMessage()
	},


	methods: {
        setMessage() {
				if (this.$route.params.id == 1) {
                this.message = "Success: Post updated"
                } 
				if (this.$route.params.id == 2) {
                this.message = "Success: User deleted"
                }
				if (this.$route.params.id == 3) {
                this.message = "Success: Post added to database"
                }
				if (this.$route.params.id == 4) {
                this.message = "Welcome! You can now login"
                }
				if (this.$route.params.id == 5) {
                this.message = "Welcome back " + this.userStore.getUser.name + "!"
                }
				if (this.$route.params.id == 6) {
                this.message = `Bye ${this.userStore.user.name}, come back soon!`
                }	
				if (this.$route.params.id == 7) {
                this.message = "Success: Comment added to database"
                }																
				
				var timeleft = 2;
				var downloadTimer = setInterval(() => {
					if(timeleft <= 0){
						clearInterval(downloadTimer)
						this.$router.push('/')
					}
				timeleft -= 1
				}, 1000)
		},


	},
   

}
</script>

<style scoped>
	.logout {
	margin: 0 auto;
	max-width: 800px;
	}

	.success-message {
	color: #32a95d;
	}

	.error-message {
	color: #d33c40;
	}

</style>