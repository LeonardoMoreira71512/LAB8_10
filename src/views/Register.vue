<template>
<div>
		
	<Header />
	<div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card" style="box-shadow: 0 0 20px #08c60e;">
                    <div class="card-header">
                        <div class="text-center rounded-top">
                            <img src="../assets/images/mushroom.png" width="70" height="70">
                            <h2>Register</h2>
                        </div>
                        <div class="card-body">
                            <form @submit.prevent="handleSubmit">
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name:</label>
                                    <input v-model="user.name" placeholder="Enter Username" type="text" class="form-control" id="name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email:</label>
                                    <input v-model="user.email" placeholder="Enter email" type="email" class="form-control" id="email" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password:</label>
                                    <input v-model="user.password" type="password" class="form-control" id="password" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password_confirmation" class="form-label">Confirm Password:</label>
                                    <input v-model="user.passwordConfirm" type="password" class="form-control" id="password_confirmation" required>
                                </div>
								<div v-if="error" class="alert alert-danger" role="alert">
 	            						{{ error }}
 	          					</div>
                                <button type="submit" class="btn btn-primary">Register</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
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
				if (!await this.userStore.userExistsDB(this.user)) {
					//user does not exist in database ; register new user
					await this.userStore.addUserDB();
					// Redirect to Message.vue or some success page
					this.$router.push('/message/4');
				} else {
					this.error = 'User already exists with this email.';

				}
			
			this.submitting = false;
		},
		cancel() {
			// Logic to cancel the form or navigate away
			this.$router.push('/');
		},
	},
	
	computed: {
		invalidName: function () {
			if (this.user.name === '' || this.user.name.length > 15 || this.user.name.match(/[0-9]/g) != null) return true
			else return false
		},
		invalidEmail: function () {
			if (this.user.email === '' || this.user.email.search('@') === -1) return true
			else return false
		},
		invalidPassword: function () {
			if (this.user.password.length < 3) return true
			else return false
		},
		invalidPasswordConfirm: function () {
			if (this.user.passwordConfirm != this.user.password) return true
			else return false
		},
	},
	directives: {

	},
	created() {
		this.submitting = false
		this.error = false
	}
}
</script>

<style scoped>


</style>