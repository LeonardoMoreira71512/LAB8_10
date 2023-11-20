<template>
<div>
		
	<Header />

	
	<Footer />
</div>
</template>

<script>

import Footer from '@/components/Footer.vue'
import Header from '@/components/Header.vue'

import { useUserStore } from '@/store/user'

export default {

	setup() {
		const userStore = useUserStore()
		return { userStore }
  	},	
	components: {
		Footer,
        Header
	},
	data() {
      return {	
        user: {
			name: '',
			email: '',
			password: '',
        },
		passwordConfirmation: '',
		submitting: false,
		error: null,	
      }
    },
	
	methods: {
		async handleSubmit() {
			// Reset the submitting state and error message
			this.submitting = true;
			this.error = null;

			// Check each validation case separately
			if (this.invalidName) {
				this.error = 'Please enter a valid name.';
				this.submitting = false;
				return;
			}

			if (this.invalidEmail) {
				this.error = 'Please enter a valid email address.';
				this.submitting = false;
				return;
			}

			if (this.invalidPassword) {
				this.error = 'Please enter a valid password.';
				this.submitting = false;
				return;
			}

			if (this.invalidPasswordConfirm) {
				this.error = 'Password confirmation does not match.';
				this.submitting = false;
				return;
			}
			//validation passedd 
				// Check if user exists and then add the user
				if (!await this.userStore.userExistsInDB(this.user)) {
					//user does not exist in database ; register new user
					await this.userStore.addUserInDB();
					// Redirect to Message.vue or some success page
					this.$router.push('/message/4');
				} else {
					this.error = 'User already exists with this email.';
				}
			
			this.submitting = false;
		},
		cancel() {
			// Logic to cancel the form or navigate away
			this.router.push('/');
		},
	},
	
	computed: {

	},
	directives: {

	},
	mounted() {


	}
}
</script>

<style scoped>


</style>