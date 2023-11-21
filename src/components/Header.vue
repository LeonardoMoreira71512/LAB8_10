<template>
    <div >
		<!-- Bootstrap Navbar -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <router-link class="navbar-brand" to="/">
            <img src="../assets/images/flag.png" alt="Logo" width="25" height="25">
		</router-link>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <router-link class="nav-link active" to="/"><i class="fa fa-fw fa-home"></i> Home</router-link>
                </li>
                <li v-if="userIsEmpty" class="nav-item">
                   <router-link class="nav-link" to="/register"><i class="fa fa-fw fa-envelope"></i> Register</router-link>
                </li>
				<li v-else class="nav-item">
                   <router-link class="nav-link" to="/post"><i class="fa fa-fw fa-envelope"></i> Post Blog</router-link>
                </li>
                <li v-if="userIsEmpty" class="nav-item">
                    <router-link class="nav-link" to="/login"><i class="fa fa-fw fa-user"></i> Login</router-link>
                </li>
				<li v-else class="nav-item">
                   <a @click.prevent="logout()" class="nav-link" href="/logout"><i class="fa fa-fw fa-envelope"></i> Logout</a>
                </li>
				<li v-if="!userIsEmpty" class="welcome-container">
	        		<h2 class="welcome-message">Welcome, {{ userStore.getUser.name }}</h2>
	    		</li>
            </ul>
        </div>


        <span class="navbar-text" style="box-shadow: 0 0 10px #08c60e;">
            MIPS TRIP - EINDHOVEN EXPERIENCE
        </span>
    </nav>
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
		async logout() {
			await this.$router.push('/message/6');
            await this.userStore.logoutUserDB();
  		}	
	},
	computed: {
		userIsEmpty: function () {
			let obj = this.userStore.getUser
			return Object.keys(obj).length === 0;
		}
	}
}
</script>

<style scoped>

.welcome-container {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translateY(-50%) translateX(-50%);
    background-color: #e8f5e9;
    padding: 5px 10px;
    border-radius: 20px;
}
.welcome-message {
    text-align: center;
    color: #2e7d32;
    font-weight: bold;
    margin: 0;
}
</style>


