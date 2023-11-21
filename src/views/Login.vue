<template>
<div>

    <Header />
	<div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card" style="box-shadow: 0 0 20px #08c60e;">
                    <div class="card-header">
                        <div class="text-center rounded-top">
                            <img src="../assets/images/mushroom.png" width="70" height="70" alt="mushroom">
                            <h2>Login</h2>
                        </div>
                    </div>
                    <div class="card-body">
                        <form @submit.prevent="handleSubmit">
                            <div class="mb-3">
                                <label for="email" class="form-label">Email:</label>
                                <input v-model="user.email" type="email" class="form-control" id="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password:</label>
                                <input v-model="user.password" type="password" class="form-control" id="password" required>
                            </div>
							<div v-if="error" class="alert alert-danger" role="alert"> {{ error }}</div>
                            <div class="form-group form-check">
                                <label class="form-check-label">
	                                <input class="form-check-input" type="checkbox" name="rememberMe" value="yes"> Remember me
	                            </label>
                            </div>
							<p></p>
							<router-link to="/" class="text-end">Forgot password?</router-link>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>
                        </form>
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
			email: '',
			password: '',
        },
		submitting: false,
		error: null,
      }
    },
	
	methods: {
		handleSubmit: function () {
			this.submitting = true
			this.clearStatus()

			if (this.invalidEmail || this.invalidPassword) {
				this.error = 'Login failed: wrong email or password';
				return
			}

			this.loginUser(this.user)


		},
		clearStatus: function () {
			this.error = null
		},

		async loginUser(user) {
			const loginResponse = await this.userStore.loginUserDB(user);
			if (loginResponse) {
				localStorage.setItem('userSession', JSON.stringify(loginResponse.userSessionData));		
				this.$router.push('/message/5')
			}
			else {
				//login failed				
				this.error = 'Wrong credentials';
				this.submitting = false
			}

		},
		cancel() {
			this.$router.push('/');
		},
	},
	
	computed: {
		invalidPassword: function () {
			if (this.user.password === '') return true
			else return false
		},

		invalidEmail: function () {
			if (this.user.email === '' || this.user.email.search('@') === -1) return true
			else return false
		},
	},
	directives: {

	},
	created: function() {
		this.submitting = false
		this.error = false
	}
}
</script>

<style scoped>

</style>