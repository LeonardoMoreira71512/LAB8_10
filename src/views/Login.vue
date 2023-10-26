<template>
<div>

    <Menu />



    <Footer />

</div>
</template>

<script>

import Footer from '@/components/Footer.vue'
import Menu from '@/components/Menu.vue'

import { useUserStore } from '@/store/user'

export default {

	setup() {
		const userStore = useUserStore()
		return { userStore }
  	},

	components: {
		Footer,
        Menu
	},   
	data() {
      return {	
        user: {
			email: '',
			password: '',
        },
		submitting: false,
		error: false,
      }
    },
	
	methods: {

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