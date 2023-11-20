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
                    <a class="nav-link active" href="#"><i class="fa fa-fw fa-home"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-fw fa-envelope"></i> Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-fw fa-user"></i> Login</a>
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
	},
	computed: {
		userIsEmpty: function () {
			let obj = this.userStore.getUser
			return Object.keys(obj).length === 0;
		}
	}
}
</script>